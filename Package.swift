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
            checksum: "909545ab14bd4908c2660beced5fe30cd4cb364f79db1766168db2614f7bb158"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.1.1/AdSDKSwiftUI-3.1.1.zip",
            checksum: "2db0c3c40175b73214369fa49483416b925992d63a4109f1c7bc0fd17bbb8ace"
        )
    ]
)
