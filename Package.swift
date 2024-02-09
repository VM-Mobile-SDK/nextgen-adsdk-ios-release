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
            checksum: "7036d9189e39ef7f957cf260e597b1f3eac91b7124c1ae252709da4d3f22feb9"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.3.0/AdSDKSwiftUI-3.3.0.zip",
            checksum: "97f47f5bd3f3691ba3cbe96e71e7b558c05ec7dff6a217697449967e0154166e"
        )
    ]
)
