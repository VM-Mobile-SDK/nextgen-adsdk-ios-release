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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/4.0.0/AdSDKCore-4.0.0.zip",
            checksum: "eae09863120afcbbaa0c1153c2b4588b2d38f6f55f671f955d9719f4a49e5bf8"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/4.0.0/AdSDKSwiftUI-4.0.0.zip",
            checksum: "e100c92c0fa20643647338e8b87b0217d44237f3a9f2fb270ab7bd2799fbe339"
        )
    ]
)
