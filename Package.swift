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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.9.4/AdSDKCore.xcframework.zip",
            checksum: "aba1aae14f563e427197b9408ef6b26a44c15b1e7da7e4de29d2b4660ecbcd95"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.9.4/AdSDKSwiftUI.xcframework.zip",
            checksum: "3873965174a36567cfcc606a93b6d29c52e35e1fb306977989464db3809a708c"
        )
    ]
)
