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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.1.0/AdSDKCore.xcframework.zip",
            checksum: "23824e85490184fcb8ec58e78f96d1b7bf5145ac1821ffc356a0b6a411d14c88"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.1.0/AdSDKSwiftUI.xcframework.zip",
            checksum: "060fff097f96fdeadd6d71804c9fd4c6dcea30191f6d1aaa1e05de6a046835fa"
        )
    ]
)
