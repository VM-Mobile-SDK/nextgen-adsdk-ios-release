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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.0.25/AdSDKCore-0.0.25.zip",
            checksum: "13943c18a0cd5b7e18364f1df949f532ce16a4ce7cdb65312cba00b78ecf1cb1"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.0.25/AdSDKSwiftUI-0.0.25.zip",
            checksum: "7bcd860ea6d191e0988721881d47c3e6fbedf6af8dea0fee7422efdc56eb5592"
        )
    ]
)
