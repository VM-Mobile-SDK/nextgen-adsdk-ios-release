// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdSDK",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AdSDK",
            targets: ["AdSDKCore", "AdSDKSwiftUI"])
    ],
    targets: [
        .binaryTarget(
            name: "AdSDKCore",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/2.2.0/AdSDKCore.xcframework.zip",
            checksum: "4d9740c3097bcdca6ca5ff73bb20aed9899336d3f8c4b06750c99d3b56ba7ffb"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/2.2.0/AdSDKSwiftUI.xcframework.zip",
            checksum: "3f38ba9f40f28d7c75deb21b56dbe0c0f0f283055b454c44f80d7ec85ec3ac90"
        )
    ]
)
