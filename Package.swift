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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.1.0/AdSDKCore.xcframework.zip",
            checksum: "248490b482cdd9014fdba0ef999a722a586747917b1bc596878af35f4d41b16e"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.1.0/AdSDKSwiftUI.xcframework.zip",
            checksum: "7f6583dd026a5e4033afc4904631d23dc987ff718782e756393d5de4a4965921"
        )
    ]
)
