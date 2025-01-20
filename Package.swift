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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.1.0/AdSDKCore-6.1.0.zip",
            checksum: "c2cc617074553c4a9048101c6053c1c471ea7314c06d2959527b41756be6e1a6"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.1.0/AdSDKSwiftUI-6.1.0.zip",
            checksum: "0a2dee17c7ae35f39e421e9da69c0cbb923014d91b9bea56cf01ed8f5701e8c2"
        )
    ]
)
