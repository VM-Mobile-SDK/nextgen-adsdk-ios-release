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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.3.0/AdSDKCore-3.3.0.zip",
            checksum: "6761ed40ca46a23923a9711e7633d0ce4fea784b0b4358873251e51a37a7fcf1"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.3.0/AdSDKSwiftUI-3.3.0.zip",
            checksum: "f37f509937604a6fd61cf685048633dd024c6d7cb6602b92c416964a7e3661ab"
        )
    ]
)
