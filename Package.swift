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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.1.0/AdSDKCore-5.1.0.zip",
            checksum: "823ca2886abcb01508b887827416d1beb8472824d08c003b2d9b7b80d30674f0"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.1.0/AdSDKSwiftUI-5.1.0.zip",
            checksum: "de46ebfb4f8a5dc6cc996a0134a50b0a28a518edcdaa9e39847679477d48033e"
        )
    ]
)
