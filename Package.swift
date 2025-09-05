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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.5.0/AdSDKCore-6.5.0.zip",
            checksum: "f7ce6b74876d5e0334b4400087dece543ce5aa653e79a17443ac890f4ca860e8"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.5.0/AdSDKSwiftUI-6.5.0.zip",
            checksum: "9b2f4543550600ebf3e3d8c1cc85ba6095230779535db9e475c8f3b42ce63289"
        )
    ]
)
