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
            url: "https://api.github.com/repos/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/assets/115015832.zip",
            checksum: "45de08d26c4d7993f5e92503dd320a20a06b6153646c0b503639c13cd8fa6986"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://api.github.com/repos/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/assets/115015833.zip",
            checksum: "d6b2d2f96d4c66f303ba61b72fd705b9edb5447ec77b7d8107fa444724510662"
        )
    ]
)
