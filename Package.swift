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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.1.0/AdSDKCore.xcframework.zip",
            checksum: "934a3d9d40fee8e23b7ffd30eaf989cd4bc970478826c1c23b86fc3fdf59ad58"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.1.0/AdSDKSwiftUI.xcframework.zip",
            checksum: "a5f885f1ceca302877d9bb3f29414df63dd74c1e163b858b66f828e9ab77fe32"
        )
    ]
)
