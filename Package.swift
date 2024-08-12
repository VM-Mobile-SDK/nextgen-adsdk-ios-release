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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.4.1/AdSDKCore-5.4.1.zip",
            checksum: "567e21b81ff1b4aa58155d38be26f445fde90ebc57b6b59a0a9e7acc5e772f27"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.4.1/AdSDKSwiftUI-5.4.1.zip",
            checksum: "5d4c29bbc945fee7513a2635cb7d6a1e550638de9312e49b1e05cec66e95617a"
        )
    ]
)
