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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.2.0/AdSDKCore-3.2.0.zip",
            checksum: "94dd107401ef7d0653e050b2895c8d5bc8227d1e224b9f228fa7dd9282316de1"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.2.0/AdSDKSwiftUI-3.2.0.zip",
            checksum: "b56ae84182f6f0dce29421359e4a2b2b448808606b35688565308e1c3e8d9c9b"
        )
    ]
)
