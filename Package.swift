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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.1.1/AdSDKCore-3.1.1.zip",
            checksum: "31e20e230f8fd21250f0187ada264cfe4726458f9fcdc486cdf945578d8338ee"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.1.1/AdSDKSwiftUI-3.1.1.zip",
            checksum: "5398c8f422454b4085531ede8b14358b2bd818b344d0715ecb257bc365750880"
        )
    ]
)
