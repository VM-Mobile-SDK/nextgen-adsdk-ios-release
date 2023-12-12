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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.0.0/AdSDKCore.xcframework.zip",
            checksum: "440ad2051491c15f842fa8bd84bba0e12240979ec545c2025e7a3b964058c50f"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.0.0/AdSDKSwiftUI.xcframework.zip",
            checksum: "8e542b15a427806d72a03fc87174207a70b39115be6505ea73d75823c7ceb20a"
        )
    ]
)
