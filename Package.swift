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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/1.0.0/AdSDKCore.xcframework.zip",
            checksum: "6f74a085904ff3c89b9b54e37026244b8f2d45ef9862fe95941e6f37b03274c0"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/1.0.0/AdSDKSwiftUI.xcframework.zip",
            checksum: "6f066f4e39d15238312f5a5bc0ace6406cbb0ef6b49ea24dcab80b3bd8fe3a76"
        )
    ]
)
