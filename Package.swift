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
            checksum: "cccc61076f69e6378466b53bd77428ed3aaf149d768a681f0da251960df913db"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.0.25/AdSDKSwiftUI-0.0.25.zip",
            checksum: "df0fd67213da8f5ea62a417209d27dbc6ee357727991825e915d651c3c46a9d9"
        )
    ]
)
