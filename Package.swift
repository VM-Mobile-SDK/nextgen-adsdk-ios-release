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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.8.0/AdSDKCore-6.8.0.zip",
            checksum: "06ffbc67286a79d6e57ff1c0da25488c63f5e1570ea465bcf627bac30281fd6d"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.8.0/AdSDKSwiftUI-6.8.0.zip",
            checksum: "207b46da4a833ca4595fc9015b30b00ed74197830b6714a1422cd417c92c4b11"
        )
    ]
)
