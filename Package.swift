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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.7.0/AdSDKCore-6.7.0.zip",
            checksum: "6514f1c2db057f0ffc96c7e09957a00f1ad9209a9a269e7d25470c78e58d8f91"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.7.0/AdSDKSwiftUI-6.7.0.zip",
            checksum: "3b9e8adcce0a1b280333a50c1755c5c794fcae07bbc0456e4d9662429700da2f"
        )
    ]
)
