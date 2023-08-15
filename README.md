# nextgen-adsdk-ios-release
This package contains the frameworks for using Aditions nextgen AdSDK for iOS.

## Authorization

The Repo has been marked "public", so no authentication or authorization needed.

## Adding the package

1. In Xcode, select "Add Package" from the File menu. 
1. In the dialogue, paste the URL to this repo. 
1. Make sure to only include the base URL, e.g. `https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release`
	
Xcode will then add the package as a dependency.

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

Advertisements will emit two types of events:

Lifecycle vents: `loading`, `caching`, `readyToPresent` and, conditionally, `error`
and tracking events: 

* tap(url:data:) - user triggered an URL, for example by tapping on an Ad
* impression(url:data:) - the ad has been rendered, irregardless if it has been seen by the user or not. Can be triggered if the add is outside of the viewport
* viewable(percentage:url:data:) At least 1%/50%/100% of the Ad has been actually seen by the user


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

To enable the partial visibility events  ``AdEvent/viewable(percentage:url:data:)``, you have to add the .adsContainer() modifier:

```swift
var body: some View {
	List {
		ForEach(cellViewModels) {
			AdCell(viewModel: $0)
		}
	}
	.clipped()
	.adsContainer()
}
```
## Aditional documentation

You can find the documentation here: https://vm-mobile-sdk.github.io/nextgen-adsdk-ios-release/documentation/adsdkcore/




