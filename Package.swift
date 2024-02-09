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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.3.0/AdSDKCore-3.3.0.zip",
            checksum: "0c3e62d51c1c6b8f38fae42fe02b439620bdcf857328ffbd6aa1688f4fa8dc3a"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.3.0/AdSDKSwiftUI-3.3.0.zip",
            checksum: "ce0cbcf35343ce33b8c15c1cf7eccc75d91b3f3523114d8eaa38bfd7182ce7fc"
        )
    ]
)
