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
            url: "https://api.github.com/repos/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/assets/107330225.zip",
            checksum: "c75e796d4df2f6a940aeda44dd71bf3b3840f2148926aa870ad350d47bb08558"
        ),
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
	    
	// to download this library from a github release, you need a working access to the repo
		// a good way to do this is by adding a private token
		// and then setting up your .netrc file
		// we will provide a detailed howto in the future
	    
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://api.github.com/repos/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/assets/107330224.zip",
            checksum: "0a3fbe185fe267614a1893a36fefea134c2f4c0a760de94a51bd40206a69bf91"
        )
    ]

)
