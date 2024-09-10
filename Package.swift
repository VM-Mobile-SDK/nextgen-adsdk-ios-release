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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.5.0/AdSDKCore-5.5.0.zip",
            checksum: "9e904e3ff0f8ed9ef74dbdb017b5a80e13b34836e9cf517d84f71fb3cc742a9b"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.5.0/AdSDKSwiftUI-5.5.0.zip",
            checksum: "8aad42f14f1b4630ca90127a8c6a9099e6cea25b6d76d3c250bb2a4a447ea02c"
        )
    ]
)
