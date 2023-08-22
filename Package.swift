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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.1.0/AdSDKCore.xcframework.zip",
            checksum: "86238ec20d3fe66ea75275f8d662d8616194d530a8d466f2442ea97ea3a6a313"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.1.0/AdSDKSwiftUI.xcframework.zip",
            checksum: "85fbdbbf93fe9c45e08c84a648426ca59e155e2712dbe8fe03fe00f6ea3cfd32"
        )
    ]
)
