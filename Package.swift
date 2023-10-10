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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/2.0.0/AdSDKCore.xcframework.zip",
            checksum: "4143f0f4a5a1d55051f57ad2b5aa26e534624a4226a6600816ba22534560740e"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/2.0.0/AdSDKSwiftUI.xcframework.zip",
            checksum: "e54a7b2dd3930e0d01374cffd6f6f56615a1493554036d5d40c2a67f4bff80aa"
        )
    ]
)
