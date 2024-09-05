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
            checksum: "3714bbddb5a1d9436261bd63fa9fdeaec7dcef5607fb21a00cfb740447fa4c9a"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.0.25/AdSDKSwiftUI-0.0.25.zip",
            checksum: "801905c101868902b1ff90830d9f36e6a0ebe905d1887f306c95d99a16943070"
        )
    ]
)
