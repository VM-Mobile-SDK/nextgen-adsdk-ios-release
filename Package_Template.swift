// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "myPackage",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "%%name%%",
            targets: ["%%name%%"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on...
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "%%name%%",

			// to download this library from a github release, you need a working access to the repo
			// a good way to do this is by adding a private token
			// and then setting up your .netrc file
			// we will provide a detailed howto in the future
            url: "%%url%%.zip",
            checksum: "%%checksum%%"
        )
    ]

)
