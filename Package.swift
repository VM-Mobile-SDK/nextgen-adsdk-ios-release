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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.0.1/AdSDKCore.xcframework.zip",
            checksum: "d6edd516c49a60e4687be70a4e806d32a57ddb6aefa6c441522adc40ddecb987"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.0.1/AdSDKSwiftUI.xcframework.zip",
            checksum: "11c3d87e1b8a88572758ea71dc08839dbc03e0c194f8b67429c910829eb651c4"
        )
    ]
)
