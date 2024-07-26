# nextgen-adsdk-ios-release
This repo contains the frameworks for using Aditions nextgen AdSDK for iOS.

## Authorization

The Repo has been marked "public", so no authentication or authorization needed.

## Installation

### Swift Package

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

1. In Xcode, select "Add Package" from the File menu. 
1. In the dialogue, paste the URL to this repo. 
1. Make sure to only include the base URL, e.g. `https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release`
	
Xcode will then add the package as a dependency.

### Cocoapods

[CocoaPods](https://cocoapods.org) is a dependency manager for Swift and Objective-C Cocoa projects.

To integrate AdSDK into your project, you need to add it to your `Podfile`, for example:
```ruby
platform :ios, '14.0'
use_frameworks!

target 'MyApp' do
  pod 'AdSDKCore', '~> 5.4'
  pod 'AdSDKSwiftUI', '~> 5.4'
end
```

## Documentation

You can learn more about how to work with the SDK in the [documentation](https://vm-mobile-sdk.github.io/nextgen-adsdk-ios-release/documentation/adsdkcore/). You can also follow a series of [interactive tutorials](https://vm-mobile-sdk.github.io/nextgen-adsdk-ios-release/tutorials/meet-adsdk) that will show you how to integrate the SDK into a new application.

**Note:** if your experience “cannot load page” errors when navigating between entries in this documentation, then the culprit is very likely an activated ad blocker. Many of the documented classes and services have names related to advertising terms. We found that this can trigger ad blockers. So please disable your adblocker if you have issues.
