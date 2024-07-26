#!/bin/bash

# This is part of the automated deployment of the AdSDK. 
# If you are an user of the SDK you can ignore this file.
#
# This script will update the swift package definition
# It requires six arguements:
# 1. the name of the core library to use as part of the swift package declaration
# 2. the url to the core library artifact; this is usually a zipped xcframework
# 3. the checksum of the core library artifact
# 4. the name of the swiftui library to use as part of the swift package declaration
# 5. the url to the swiftui library artifact; this is usually a zipped xcframework
# 6. the checksum of the swiftui library artifact
if [ $# -lt 6 ]; then 
  	echo "Please supply library names, urls to the library artifacts, and checksum of those artifacts for the core and swiftUI libraries."
	echo "Usage: $0 <core library name> <core asset url> <core asset checksum> <swiftui library name> <swiftui asset url> <swiftui asset checksum>"
	echo "The library name will be used in the Swift package declaration as the package name and target name." 
	echo "The url to the core library artifact is the URL of the xcframework zip attachet to the release."
   	echo "The asset checksum is the checksum of the xcframework zip attached to the release that will be used in package declaration."   
  	exit 1
fi

coreLibraryName=$1
coreUrl=$2
coreChecksum=$3
swiftUILibraryName=$4
swiftUIUrl=$5
swiftUIChecksum=$6

# Move to the Package.swift file
cd ..
touch Package.swift

# Now we need to put the url and the checksum in the Package.swift file
# We have a template for this and do a search/replace
sed "s+%%coreUrl%%+$coreUrl+g; s+%%swiftUIUrl%%+$swiftUIUrl+g; s+%%coreChecksum%%+$coreChecksum+g; s+%%swiftUIChecksum%%+$swiftUIChecksum+g; s+%%coreLibraryName%%+$coreLibraryName+g; s+%%swiftUILibraryName%%+$swiftUILibraryName+g;" Scripts/Templates/Package_Template.swift > Package.swift

echo "\n\nPackage.swift updated:\n\n"
cat Package.swift