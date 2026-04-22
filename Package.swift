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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.9.0/AdSDKCore-6.9.0.zip",
            checksum: "bba57294b20714c98e29abd9b1ecc6ad50debff3a253d6a61dda41b15e452eeb"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.9.0/AdSDKSwiftUI-6.9.0.zip",
            checksum: "219de4853338bdc56faf526895546f29b3742dffdd33928c3eff565cd47760e0"
        )
    ]
)
