// swift-tools-version: 6.0

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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.6.0/AdSDKCore-6.6.0.zip",
            checksum: "73d5a61dae59f1a3ee1939900769d328fdf9db05aaef34389d72aa60ce409c93"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.6.0/AdSDKSwiftUI-6.6.0.zip",
            checksum: "663a5ed9d07af38e49ce94115c5a7258be90d61927f5ad462c1d8f28b78a4287"
        )
    ]
)
