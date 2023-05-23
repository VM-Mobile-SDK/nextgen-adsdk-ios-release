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
            url: "https://api.github.com/repos/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/assets/109420403.zip",
            checksum: "55500143a17deb0506a3e7bb94d67699502dc39dcb9520780a2f71cd954f4723"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://api.github.com/repos/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/assets/109420404.zip",
            checksum: "f17083da54ccfdee7e143c40379aa68b713501165771fd312c59ab56a07b7527"
        )
    ]
)
