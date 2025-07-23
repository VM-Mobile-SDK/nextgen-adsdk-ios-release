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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.3.0/AdSDKCore-6.3.0.zip",
            checksum: "da8b8a6b5b8fbc6700ec3e593c553271f8a2270543f30b40130039bfbe7cbbb3"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.3.0/AdSDKSwiftUI-6.3.0.zip",
            checksum: "1f6e6ba118b83d5f666a73ebc46af1704645aaa8dcb34ff30b89184db31a3c08"
        )
    ]
)
