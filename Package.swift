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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/2.1.0/AdSDKCore.xcframework.zip",
            checksum: "ac4b713f37466686f9a313cefc2b883c9e2ea7abcb3401e298562c2087335852"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/2.1.0/AdSDKSwiftUI.xcframework.zip",
            checksum: "1f1a03907e966faff8cf12c5e64292dc96fbeceb5d6a5c6dffab64267eddee89"
        )
    ]
)
