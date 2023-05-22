// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdSDK",
    platforms: [
    	.iOS(.v14_4),
    ],    
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
            url: "https://api.github.com/repos/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/assets/108264264.zip",
            checksum: "58fed5a796a072d09e1de9d8a2d2298d40dd2b925b995d0244e32025521d8671"
        ),
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
	    
	// to download this library from a github release, you need a working access to the repo
		// a good way to do this is by adding a private token
		// and then setting up your .netrc file
		// we will provide a detailed howto in the future
	    
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://api.github.com/repos/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/assets/108264265.zip",
            checksum: "2dd8ce9b4fc0c3ff1898601a1aa7d3d19a8a101f121cef3932300d2a0dc45aa0"
        )
    ]

)
