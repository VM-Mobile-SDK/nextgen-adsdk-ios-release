// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdSDK",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AdSDK",
            targets: ["AdSDKCore", "AdSDKSwiftUI"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on...
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
	    
	// to download this library from a github release, you need a working access to the repo
		// a good way to do this is by adding a private token
		// and then setting up your .netrc file
		// we will provide a detailed howto in the future
        .binaryTarget(
            name: "AdSDKCore",
            url: "https://api.github.com/repos/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/assets/107334247.zip",
            checksum: "e6da1aed567b0c7aa6a36782b748c5fa87e292572415ba6de271da90d2df8a39"
        ),
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
	    
	// to download this library from a github release, you need a working access to the repo
		// a good way to do this is by adding a private token
		// and then setting up your .netrc file
		// we will provide a detailed howto in the future
	    
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://api.github.com/repos/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/assets/107334248.zip",
            checksum: "fef029ccfd9477aaf8e1f7463f37792feb303f5f581977dfb905828bf0d4667e"
        )
    ]

)
