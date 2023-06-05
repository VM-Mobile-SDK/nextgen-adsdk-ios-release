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
            url: "https://api.github.com/repos/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/assets/109449102.zip",
            checksum: "528577e886448c2041684ff0e4fc16ddc8785ff331f50ccbbd96406327170da8"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://api.github.com/repos/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/assets/109449103.zip",
            checksum: "6671ca98aefbac19fdb3422af57040d63082599e9aca21923aaaf80f88f235a3"
        )
    ]
)
