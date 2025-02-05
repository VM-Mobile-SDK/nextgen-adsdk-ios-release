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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.1.1/AdSDKCore-6.1.1.zip",
            checksum: "62a5f601df655bb82c746d3550fed3c5ab390e224712893083ac24e51e4d1fdc"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.1.1/AdSDKSwiftUI-6.1.1.zip",
            checksum: "29855ee4a3268424b6e51ddea398fa344014b5ff5765b47904c5774b2131a0e6"
        )
    ]
)
