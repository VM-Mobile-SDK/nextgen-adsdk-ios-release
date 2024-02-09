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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.3.1/AdSDKCore-3.3.1.zip",
            checksum: "25a581e5ff4b99130e4e0a14d45f4f2b2030703be9a1a2bbd938637ce52180de"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.3.1/AdSDKSwiftUI-3.3.1.zip",
            checksum: "30f6a59bcf4d2ea6d295715bd56a01644c9d8525323238620987167ab5f47ed4"
        )
    ]
)
