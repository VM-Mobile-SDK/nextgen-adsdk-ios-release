// swift-tools-version: 6.0

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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.0.0/AdSDKCore-6.0.0.zip",
            checksum: "c0d29682963682c2601540703fdcd752e1bad7c00697eac93e966ce21c56b47e"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.0.0/AdSDKSwiftUI-6.0.0.zip",
            checksum: "decfc53b4f4e22812c1260f0b7b06c6fe0545364c59209f07ba87dccef1d377e"
        )
    ]
)
