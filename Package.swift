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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.0.26/AdSDKCore-0.0.26.zip",
            checksum: "09d59fc1255f65da817559772f8bfb6ffd9940fb7d66c6b0cb594383e30109a6"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.0.26/AdSDKSwiftUI-0.0.26.zip",
            checksum: "82eaeefe01eb79d737c0223d3f6b09f4d951cfc0acf67fe5548f858dfd493d30"
        )
    ]
)
