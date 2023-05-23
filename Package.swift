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
            url: "https://api.github.com/repos/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/assets/109438495.zip",
            checksum: "79127874cecbd319a278a966b9a02b7a53a03cfd1f98cb6f5a0bc4ff2f650a2b"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://api.github.com/repos/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/assets/109438496.zip",
            checksum: "3a9b993761f32a6b91a4d7a0045e9535896ccef7529a33f610d864080500933d"
        )
    ]
)
