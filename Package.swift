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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.2.0/AdSDKCore-5.2.0.zip",
            checksum: "f8e83cfbedba56f73f2f4b23102a3fcfea9f0bf6978bcecd457efb4568dc9f50"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.2.0/AdSDKSwiftUI-5.2.0.zip",
            checksum: "3da990613f92cd6f4206404902d4945de3636c5df249903d75936f8822278bec"
        )
    ]
)
