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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.9.1/AdSDKCore-6.9.1.zip",
            checksum: "48e941cf4a898c1a535989120ac5a09d1530331dc1e202af957d5ab068b1f514"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/6.9.1/AdSDKSwiftUI-6.9.1.zip",
            checksum: "e63e2c791e1a2cfcfcf2e89a1e40b0a7ba22fc678681856bd6f731fa46765d7c"
        )
    ]
)
