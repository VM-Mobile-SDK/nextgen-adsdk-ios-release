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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.0.26/AdSDKCore-0.0.26.zip",
            checksum: "dc5918993986e90bdeee6de71e614d91d472fa3ddf7e5d9c51fbafb67c9dc512"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.0.26/AdSDKSwiftUI-0.0.26.zip",
            checksum: "70cb019e2b31e1ed36119f7af62a3ddb63a45fdf05dc9937eedac719830d70c8"
        )
    ]
)
