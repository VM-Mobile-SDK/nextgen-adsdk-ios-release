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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.5.0/AdSDKCore-5.5.0.zip",
            checksum: "9a2fd44ac48d16483fe7ec5db44a65f6d6258df4148f6c61d467e4a563777926"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.5.0/AdSDKSwiftUI-5.5.0.zip",
            checksum: "487855e72cd779430af9acd0a501e4d3023071b571943c74e8f33f5b93f5391c"
        )
    ]
)
