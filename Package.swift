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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.5.1/AdSDKCore-5.5.1.zip",
            checksum: "8143b91567757416c1bb73f96f2ade1cf4512c2b81123274ab111091c616ff41"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.5.1/AdSDKSwiftUI-5.5.1.zip",
            checksum: "8d16d8b21c35435244183ba6a982946f80a3bcc23bdf8c3aa5b3e188984900b7"
        )
    ]
)
