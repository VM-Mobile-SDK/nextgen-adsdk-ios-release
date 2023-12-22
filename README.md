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

There are two ways to create and configure an AdService. You can choose the one you prefer.

1. In your app delegate, import AdSDKCore and AdSDKSwiftUI and call the static `configure` method of the AdService class.

Here's an example:
```swift

import UIKit
import Combine
import AdSDKCore
import AdSDKSwiftUI

final class AppDelegate: NSObject {
    // MARK: - Internal Properties
    var adService: AdService?
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
        subscription = AdService.configure(
            networkID: C.networkID,
            cacheSize: 50, // Can be ignored
            timeout: 60 // Can be ignored
        )
        .sink { [unowned self] completion in
            switch completion {
            case .failure(let error):
                stateSubject.send(.error(error.description))
                print(error.description)
            case .finished:
                print("Config: AdService configured")
                stateSubject.send(.configured)
            }

        } receiveValue: { [unowned self] adService in
            self.adService = adService
        }
    }

    func configureWithAsync() {
        Task {
            do {
                adService = try await AdService.configure(networkID: C.networkID)
                await MainActor.run {
                    stateSubject.send(.configured)
                }

            } catch {
                guard let adError = error as? AdError else {
                    print(error)
                    return
                }

                await MainActor.run {
                    stateSubject.send(.error(adError.description))
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

2. In your app delegate, import AdSDKCore and initialize and configure the AdService.

Here's an example:

```swift

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

Lifecycle vents: `loading`, `caching`, `readyToPresent(metadata:)` and, conditionally, `error`
and tracking events: 

* tap(url:data:) - user triggered an URL, for example by tapping on an Ad
* impression(url:data:) - the ad has been rendered, irregardless if it has been seen by the user or not. Can be triggered if the add is outside of the viewport
* viewable(percentage:url:data:) At least 1%/50%/100% of the Ad has been actually seen by the user
* showingAsset(id:,url:,metadata:) – the renderer is currently showing a particular asset
* customRendererEvent(name:,url:, metadata:) – signals that the renderer has passed a custom event

You can observe them like this:

```swift

// Combine interface
ad.statePublisher
    .sink { [weak self] state in
        guard let self else { return }
        
        print("State: \(state)")
        
        switch state {
        case .loading, .caching:
            self.state = .loading
            
        case .readyToPresent(let metadata):
            if let metadata {
                print(metadata)
            }
            
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

// Async Await interface
Task {
    for await state in ad.stateStream {
        print("State: \(state)")

        await MainActor.run {
            switch state {
            case .loading, .caching:
                self.state = .loading

            case .readyToPresent(let metadata):
                self.state = .view
                print("Metadata: \(metadata)")

            case .error(let error):
                guard self.retryCount >= C.maxRepeatCount else {
                    self.retryCount += 1
                    self.ad.reload()
                    return
                }

                guard let error = error as? AdError else { return }

                self.state = .error(error.description)
            }
        }
    }
}

Task {
    for await event in ad.eventStream {
        print("Event: \(event)")
    }
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

**Note:** if your experience “cannot load page” errors when navigating between entries in this documentation, then the culprit is very likely an activated ad blocker. Many of the documented classes and services have names related to advertising terms. We found that this can trigger ad blockers. So please disable your adblocker if you have issues.
