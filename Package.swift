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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.4.0/AdSDKCore-6.4.0.zip",
            checksum: "7c9be3530b7f33371a19596229c62da65307483fb41b4ce3e08100e0323b9c0c"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.4.0/AdSDKSwiftUI-6.4.0.zip",
            checksum: "ba60cc40639cb1b3a7f11c7c82807123cb7c314af5ac77d7fc22a5572ff14842"
        )
    ]
)
