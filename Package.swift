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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/4.0.1/AdSDKCore-4.0.1.zip",
            checksum: "4277c3585dec6779f756c217dc0b268e9d98f6347df08fb830bdfcb261371cb9"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/4.0.1/AdSDKSwiftUI-4.0.1.zip",
            checksum: "19263f1ffd72aded7e353e0187c4ea3312ca12644f5ae34f4fb39b1d2f7e0d9c"
        )
    ]
)
