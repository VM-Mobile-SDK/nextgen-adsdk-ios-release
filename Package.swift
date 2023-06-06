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
            url: "https://api.github.com/repos/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/assets/111467219.zip",
            checksum: "fd18fd3a218a0b671bc071df29d17a18904c05a8e9ee6ddf8f22ceefbe851343"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://api.github.com/repos/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/assets/111467218.zip",
            checksum: "a505deb786c3d606491a549ed222c23d29a3a37cd784f521630619d58b4b4dbd"
        )
    ]
)
