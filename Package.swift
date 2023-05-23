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
            url: "https://api.github.com/repos/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/assets/109415095.zip",
            checksum: "3a52744d4b321c431a89edb2daca1a70aa842620940258da03a9163fd885c7a3"
        ),
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
	    
	// to download this library from a github release, you need a working access to the repo
		// a good way to do this is by adding a private token
		// and then setting up your .netrc file
		// we will provide a detailed howto in the future
	    
        .binaryTarget(
            name: "AdSDKSwiftUI",
            url: "https://api.github.com/repos/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/assets/109415094.zip",
            checksum: "6ec2526c2d41f6827a2c49cfa30e14057d1c236d48408d872039daa8f6f18b26"
        )
    ]

)
