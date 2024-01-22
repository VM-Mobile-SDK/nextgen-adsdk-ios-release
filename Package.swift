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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.1.1/AdSDKCore-3.1.1.zip",
            checksum: "ca8be53e0082c995c175ddab97df68bf04f59c7763cd3b05e83120861206525a"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.1.1/AdSDKSwiftUI-3.1.1.zip",
            checksum: "82ca84816c90a2fe90c6ac2c9425bb5898295b55bd975a8d1c151181a196a7ec"
        )
    ]
)
