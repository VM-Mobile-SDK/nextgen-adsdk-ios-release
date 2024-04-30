# nextgen-adsdk-ios-release
This package contains the frameworks for using Aditions nextgen AdSDK for iOS.

## Authorization

The Repo has been marked "public", so no authentication or authorization needed.

## Adding the package

1. In Xcode, select "Add Package" from the File menu. 
1. In the dialogue, paste the URL to this repo. 
1. Make sure to only include the base URL, e.g. `https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release`
	
Xcode will then add the package as a dependency.

## Tracking Transparency

Starting with IOS 14, you, as a developer, are required to ask for permission to track a user. Learn more in Apple's [documentation](https://developer.apple.com/app-store/user-privacy-and-data-use).

The SDK tracks user behaviour, such as the percentage of an advert visibility on scroll or if an advert is tapped. At the moment, the SDK cannot work when a user is not allowed to be tracked. If you try to use the SDK without the user's consent to tracking, you will receive an `AdError/trackingDisabled` error.

In addition, the SDK offers a wide range of customisation options for building targeted ads. If you use additional user data when creating ads or for tracking purposes, you are responsible for adding the Privacy Manifest to your project. Learn more in Apple's [documentation](https://developer.apple.com/documentation/bundleresources/privacy_manifest_files/describing_data_use_in_privacy_manifests).

## Using the SDK

## Initialize and configure the AdService

To create and configure an `AdService`, import AdSDKCore and AdSDKSwiftUI and call the static `configure` method of the `AdService` class.

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

## Requesting & Presentings Ads

### Inline Ad

**Inline** placement type for ads that you display in your View hierarchy, for example, in a `List` or `ScrollView`.

1. Use an `AdService` instance to make an `Advertisement`.

```swift
let ad = adService.makeAdvertisement(
    request: .init(contentUnit: 4810915)
)
```

2. Once you have the advertisement object, you can display it in the view hierarchy like this:

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

### Interstitial Ad

**Interstitial** placement type for ads that appear on top of your main content.

1. Use an `AdService` instance to make an `Advertisement`.

```swift
let ad = adService.makeAdvertisement(
    request: .init(contentUnit: 4810916),
    placementType: .interstitial
)
```

2. Once you have the advertisement object, you can configure interstitial presentation like this:

```swift
import AdSDKSwiftUI
 
struct ScreenWithInterstitial: View {
    @State var viewModel: ScreenWithInterstitialViewModel

    var body: some View {
        VStack {
            Text("My Screen Content")
        }
        .interstitial(
            isShouldBePresented: $viewModel.isInterstitialPresented,
            viewModel.ad
        )
    }
}
```

## Advertisement States & Events

Advertisements will emit two types of events:

Lifecycle vents: `loading`, `caching`, `readyToPresent(metadata:)` and, conditionally, `error`
and tracking events: 

* `tap(url:data:)` - user triggered an URL, for example by tapping on an Ad
* `impression(url:data:)` - the ad has been rendered, irregardless if it has been seen by the user or not. Can be triggered if the add is outside of the viewport
* `viewable(percentage:url:data:)` – at least 1%/50%/100% of the Ad has been actually seen by the user
* `showingAsset(id:,url:,metadata:)` – the renderer is currently showing a particular asset
* `unloadRequest` – the renderer wants to be removed from the view hierarchy, in the case of an inline ad. Or the renderer will disappear automatically, in the case of an interstitial ad.
* `customRendererEvent(name:,url:, metadata:)` – signals that the renderer has passed a custom event
* `error(_ error:, eventName:)` – signals an error related to tracking.

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

To enable the partial visibility events ``AdEvent/viewable(percentage:url:data:)`` in inline ad, you have to add the `.adsContainer()` modifier:

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
