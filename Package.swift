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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.2.0/AdSDKCore-6.2.0.zip",
            checksum: "a3f74644220b2b25758338490dd2f265d1d54689035b4df23c3c5b2b5be6f78c"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.2.0/AdSDKSwiftUI-6.2.0.zip",
            checksum: "ea410b92e31dfb329d0b4d4751be8895598837b89775c631ba09d4d91e2e2c4b"
        )
    ]
)
