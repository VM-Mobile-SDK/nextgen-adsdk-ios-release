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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.2.1/AdSDKCore-5.2.1.zip",
            checksum: "3907c6f8d4df2bc14c7cb84ebbc9fe0e48acea9196687e723b6410476e5491ef"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.2.1/AdSDKSwiftUI-5.2.1.zip",
            checksum: "e3b95ca771893c10589b2e13b008877327d0b208d56b2b52339f87e2da1153a6"
        )
    ]
)
