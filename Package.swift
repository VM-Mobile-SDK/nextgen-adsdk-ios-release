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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.3.0/AdSDKCore-5.3.0.zip",
            checksum: "02c93db8579424ceda362b547809ae00fe1ea5156f08e381c0e90fa5e8759946"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.3.0/AdSDKSwiftUI-5.3.0.zip",
            checksum: "a01616632b822fa6b24f72e18ecd7ed46cc73e29159117cff811d9a9687aee91"
        )
    ]
)
