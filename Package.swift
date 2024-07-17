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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.4.0/AdSDKCore-5.4.0.zip",
            checksum: "40b5c05ab19955b6d1827641a00a36c42be6dc3636097679bbff7632a7dda41f"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.4.0/AdSDKSwiftUI-5.4.0.zip",
            checksum: "f45c2fa74eea3940944144175b2d0bc78c5c55286e6c78da614ca5d42d784d90"
        )
    ]
)
