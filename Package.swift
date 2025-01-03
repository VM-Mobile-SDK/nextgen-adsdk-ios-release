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
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.0.10/AdSDKCore-0.0.10.zip",
            checksum: "652500f179e461b1b6e599e92538e6daa7598ab0a180ea7b2f6ca25347ab1f6c"
        ),
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/0.0.10/AdSDKSwiftUI-0.0.10.zip",
            checksum: "e3267c4eaff5cc498fc5546b727d8f8d144348b96151a23616818318eccd39cb"
        )
    ]
)
