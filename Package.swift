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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.0.0/AdSDKCore-5.0.0.zip",
            checksum: "0142c5b0baea184872451b53495f18f2c15893ac7a20e4154e3b026b42700954"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.0.0/AdSDKSwiftUI-5.0.0.zip",
            checksum: "380f6ecff17faf60bb8c5f7682c367fd6cfbe4bdfa7239a0324ad0393df2037b"
        )
    ]
)
