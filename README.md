# nextgen-adsdk-ios-release
This package contains the frameworks for using Aditions nextgen AdSDK for iOS.

## Authorization

* Pick a github account that has read access to the repo containing the release.
* Generate a private access token for this account.
* Update your `~/.netrc` file. 

Your `~/.netrc` file should contain an entry like this

`machine api.github.com login <your-github-account-name> password <your-github-private-access-token>`

## Adding the package

1. In Xcode, select "Add Package" from the File menu. 
1. In the dialogue, paste the URL to this repo. 
1. Make sure to only include the base URL, e.g. `https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release`
1. When prompted for authorization, select login -> Use Github Account
1. Login by providing the account you use to access this repo and a valid personal access token

If Xcode can see the package but fails to download the framework binaries, then it's likely that your authorization for the github API did fail. Doublecheck your .netrc configuration, see section 'Authorization' above.
	
Xcode will then add the package as a dependency.

## Compile Time Settings

In your Info.plist file, add two new keys: `AD_TYPES` and `BASE_URL`.

`AD_TYPES` allows you to specify the ad types you want to support in your app. Right now, the only valid option is this string: "nativeimg,customnative". This tells the Adition AdServer that the SDK and the app support native image ads and custom native ads.

`BASE_URL` allows you to specify the name of the AdServer. Please use `adsdk.adfarm1.adition.com`.

## Using the SDK

## Initialize and configure the AdService

In your app delegate, import AdSDKCore and initialize and configure the AdService.

Here's an example:

```swift

//
//  AppDelegate.swift
//  AdSDKDemo
//
//  Created by Artem Kvasnetskyi on 19.04.2023.
//

import UIKit
import Combine
import AdSDKCore
import AdSDKSwiftUI

final class AppDelegate: NSObject {
    // MARK: - Internal Properties
    let adService = AdService(networkID: C.networkID)
    private(set) lazy var statePublisher = stateSubject
        .eraseToAnyPublisher()

    // MARK: - Private Properties
    private let stateSubject = CurrentValueSubject<State, Never>(.loading)
    private var subscription: AnyCancellable?
}

// MARK: - UIApplicationDelegate
extension AppDelegate: UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        adService.registerNativeRenderers()
        configure()
        return true
    }
}

// MARK: - Internal Methods
extension AppDelegate {
    func configure() {
        configureWithCombine()
//        configureWithAsync()
    }
}

// MARK: - Private Methods
extension AppDelegate {
    func configureWithCombine() {
        subscription = adService.configure()
            .sink { [unowned self] completion in
                switch completion {
                case .failure(let error):
						stateSubject.send(.error(error.localizedDescription))

                case .finished:
                    print("Config: AdService configured")
                    stateSubject.send(.configured)
                }
            } receiveValue: { _ in }
    }

    func configureWithAsync() {
        Task { [unowned self] in
            do {
                try await adService.configure()
                await MainActor.run {
                    stateSubject.send(.configured)
                    print("Config: AdService configured")
                }

            } catch {
                guard let error = error as? AdError else { return }

                await MainActor.run {
					stateSubject.send(.error(error.localizedDescription))
                }
            }
        }
    }
}

// MARK: - Models
extension AppDelegate {
    enum State {
        case loading
        case configured
        case error(_ description: String)
    }
}

// MARK: - Static Properties
private enum C {
    static let networkID: UInt = 1800
}
```

## Requesting Ads & using AdViews

Use an adService instance to make an advertisement.

```swift
  let ad = try adService.makeAdvertisement(
                request: .init(contentUnit: 4810915)
            )

```

Once you have the advertisement object, you can display it in the view hierarchy like this:

```swift
 
import AdSDKSwiftUI
 
struct AdCell: View {
    // MARK: - Internal Properties
    @StateObject var viewModel: AdCellViewModel

    // MARK: - Body
    var body: some View {
        switch viewModel.state {
        case .loading:
            loader()
        case .view:
            AdView(advertisement: viewModel.ad)
        case .error(let description):
            error(description)
        }
    }
}

```

The advertisement will emit events during its lifecycle: `loading`, `caching`, `readyToPresent` and, conditionally, `error`. 

You can observe them like this:

```swift

        ad.statePublisher
            .sink { [weak self] state in
                guard let self else { return }

                print("State: \(state)")

                switch state {
                case .loading, .caching:
                    self.state = .loading

                case .readyToPresent:
                    self.state = .view

                case .error(let error):
                    guard self.retryCount >= C.maxRepeatCount else {
                        self.retryCount += 1
                        self.ad.reload()
                        return
                    }

                    guard let error = error as? AdError else { return }

                    self.state = .error(error.description)

                @unknown default: break
                }
            }
            .store(in: &subscriptions)

        ad.eventPublisher
            .sink { event in
                print("Event: \(event)")
            }
            .store(in: &subscriptions)
    }

```






