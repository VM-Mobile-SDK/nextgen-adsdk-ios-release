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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.0.12/AdSDKCore-0.0.12.zip",
            checksum: "6105f79565b64da8388d685d20efb1ffb37203c242ec0945d3546e2389d947ba"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.0.12/AdSDKSwiftUI-0.0.12.zip",
            checksum: "acd51e25febba6dc48b3762716307c6838b9556a824670453cc5497593b7a841"
        )
    ]
)
