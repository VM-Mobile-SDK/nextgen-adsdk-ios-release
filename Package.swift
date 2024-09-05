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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.0.25/AdSDKCore-0.0.25.zip",
            checksum: "5fdf536900c7e6aada38dcf31a27c99f45c876eb080fa96249cbf5fba0000948"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.0.25/AdSDKSwiftUI-0.0.25.zip",
            checksum: "09daa9ebf21ea8c77a96605d2bf10c4c1f75494804452d911c1d6849087e3057"
        )
    ]
)
