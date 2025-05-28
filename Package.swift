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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.2.1/AdSDKCore-6.2.1.zip",
            checksum: "3e5067c849ae7acb6eec7a1636dcff71af56467f382a572a0784fcff65b24c2d"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.2.1/AdSDKSwiftUI-6.2.1.zip",
            checksum: "33802451d84c18c11182dc518d94752f3ce3066caf7de3a8b3ddbe8694ef9495"
        )
    ]
)
