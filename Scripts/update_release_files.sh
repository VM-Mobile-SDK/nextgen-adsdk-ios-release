#!/bin/bash

# This is part of the automated deployment of the AdSDK.
# If you are an user of the SDK you can ignore this file.
#
# This script will update the swift package and podspecs definitions.
# It requires five arguements:
# 1. github release
# 2. the name of the core library to use as part of the swift package and podspecs declaration
# 3. the file name of the core library asset of the release to be used; this is usually a zipped xcframework
# 4. the name of the swiftUI library to use as part of the swift package declaration
# 5. the file name of the swiftUI library asset of the release to be used; this is usually a zipped xcframework
if [ $# -lt 5 ]; then 
  	echo "Please supply a github release, library names and an asset names for the core and swiftUI libraries."
	echo "Usage: $0 <github release> <core library name> <core asset filename> <swiftUI library name> <swiftUI asset filename>"
	echo "The library name will be used in the Swift package declaration as the package name and target name, and in the podspec declaration." 
   	echo "The asset filename is the name of the xcframework zip attached to the release."   
  	exit 1
fi

release=$1
coreLibraryName=$2
coreAssetName=$3
swiftUILibraryName=$4
swiftUIAssetName=$5

echo "-----Start release number validation-----\n\n"

# First, check if the given release exists 
tagName="$(gh release view $release --json tagName  -q '.tagName')"

if [[ $? -ne 0 ]]; then
	echo "Failed to get the tag name for release $release, aborting"
	exit 1 # fail the action
else
	echo "-----Release number validation passed. Tag name is $tagName-----\n\n"
fi

# After, we should get artifacts urls and checksums.
# We will do that via separate asset_parser script.
# Let's do it for core asset first.
echo "-----Start artifacts fetching process-----\n\n"

coreAssetOutput=$(./asset_parser.sh $release $coreAssetName)
coreAssetResult=$(echo "$coreAssetOutput" | grep "RESULT:")
coreAssetUrl=$(echo $coreAssetResult | awk '{print $2}')
coreAssetChecksum=$(echo $coreAssetResult | awk '{print $3}')
echo "Found asset for core: \n- URL: $coreAssetUrl \n- Checksum: $coreAssetChecksum"

# Now we can do it for swiftui asset.
swiftUIAssetOutput=$(./asset_parser.sh $release $coreAssetName)
swiftUIAssetResult=$(echo "$coreAssetOutput" | grep "RESULT:")
swiftUIAssetUrl=$(echo $swiftUIAssetResult | awk '{print $2}')
swiftUIAssetChecksum=$(echo $swiftUIAssetResult | awk '{print $3}')
echo "Found asset for swiftui: \n- URL: $swiftUIAssetUrl \n- Checksum: $swiftUIAssetChecksum"
echo "\n\n-----Artifacts fetching process is finished-----\n\n"

# Now we need to put the url and the checksum in the Package.swift file.
# We can do it via separate update_package script.
echo "-----Package.swift updating process started-----"
sh update_package.sh $coreLibraryName $coreAssetUrl $coreAssetChecksum $swiftUILibraryName $swiftUIAssetUrl $swiftUIAssetChecksum
echo "\n\n-----Package.swift updating process finished-----\n\n"

# Last step will be changing podspecs with the new url and version.
# We can do it via separate update_podspec script.
echo "-----Podspecs updating process started-----"
sh update_podspec.sh $release $coreLibraryName $coreAssetUrl $swiftUILibraryName $swiftUIAssetUrl
echo "\n\n-----Podspecs updating process finished-----"