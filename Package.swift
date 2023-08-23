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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/1.0.1/AdSDKCore.xcframework.zip",
            checksum: "b666d4a2076601294ad346aefe04ce3e4c9c640c6532d06c2a16540f294bf1ed"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/1.0.1/AdSDKSwiftUI.xcframework.zip",
            checksum: "ff2b95e6899f4302f5b02bfe48e62b47b9a9d273f8f45e06d7e049bfee8d25a2"
        )
    ]
)
