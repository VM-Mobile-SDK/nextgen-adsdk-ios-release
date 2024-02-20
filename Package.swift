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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.3.2/AdSDKCore-3.3.2.zip",
            checksum: "4002189bbfb266c7a69f1873806bd157e7c4c1a60f4074d1539338e88e3f4459"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/3.3.2/AdSDKSwiftUI-3.3.2.zip",
            checksum: "c9730e14d535293382d26d9b2e7e367cf38b349fe0623930d17df2623158eac8"
        )
    ]
)
