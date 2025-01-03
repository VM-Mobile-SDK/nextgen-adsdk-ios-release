// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "AdSDK",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AdSDK",
            targets: ["%%coreLibraryName%%", "%%swiftUILibraryName%%"])
    ],
    targets: [
        .binaryTarget(
            name: "%%coreLibraryName%%",
            url: "%%coreUrl%%",
            checksum: "%%coreChecksum%%"
        ),
        .binaryTarget(
            name: "%%swiftUILibraryName%%",
            url: "%%swiftUIUrl%%",
            checksum: "%%swiftUIChecksum%%"
        )
    ]
)
