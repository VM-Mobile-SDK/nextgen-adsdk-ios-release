#!/bin/bash

# This is part of the automated deployment of the AdSDK 
# If you are an user of the SDK you can ignore this file.
#
# This script will update the swift package definition
# It requires five arguements:
# 1. github release
# 2. the name of the core library to use as part of the swift package declaration
# 3. the file name of the core library asset of the release to be used; this is usually a zipped xcframework
# 4. the name of the swiftUI library to use as part of the swift package declaration
# 5. the file name of the swiftUI library asset of the release to be used; this is usually a zipped xcframework
if [ $# -lt 5 ]; then 
  	echo "Please supply a github release, library names and an asset names for the core and swiftUI libraries"
	echo "Usage: $0 <github release> <core library name> <core asset filename> <swiftUI library name> <swiftUI asset filename>"
	echo "The library name will be used in the Swift package declaration as the package name and target name" 
	echo "The library name must also match the directory name containing the swift package declaration"
   	echo "The asset filename is the name of the xcframework zip attached to the release"   
  	exit 1
fi

release=$1
coreLibraryName=$2
coreAssetName=$3
swiftUILibraryName=$4
swiftUIAssetName=$5

# Check if the given release exists 
tagName="$(gh release view $release --json tagName  -q '.tagName')"

if [[ $? -ne 0 ]]; then
	echo "❌ Failed to get the tag name for release $release, aborting"
	exit 1
else
	echo "ℹ️ Tag name is $tagName"
fi

# Github has a command line tool called gh. We use this to get the list of assets associated with a release.
# One of these assets is the zip file containing the xcframework asset. We pass the output of gh through a jq filter
# to only return those asset urls that mach the library name.
coreUrl="$(gh release view $release --json assets -q ".assets[] | select(.name | test(\"$coreAssetName\")) | .url")"
swiftUIUrl="$(gh release view $release --json assets -q ".assets[] | select(.name | test(\"$swiftUIAssetName\")) | .url")"

# We will put this URL in the swift package declaration later.
echo "ℹ️ URL for core asset: $coreUrl"
echo "ℹ️ URL for swiftUI asset: $swiftUIUrl"

# Besides the URL, the swift package needs to include a checksum of the zip file. To generate the checksum, we first
# download the asset.
assets=("$coreAssetName" "$swiftUIAssetName")

for asset in "${assets[@]}"; do
    gh release download "$release" -p "$asset" --clobber --dir ../

    if [[ $? -ne 0 ]]; then
        echo "❌ Failed to download the asset $asset, aborting"
        exit 1
    else
        echo "ℹ️ Downloaded $asset"
    fi
done

# Then we use swift package compute-checksum. This needs to be run in the directory
# containing the Package.swift file.
cd ..
touch Package.swift

for asset in "${assets[@]}"; do
    checksum="$(swift package compute-checksum "$asset")"

    if [ -z "$checksum" ]; then
        echo "❌ Failed to calculate checksum for $asset"
        exit 1
    else
        echo "ℹ️ Checksum for $asset: $checksum"
    fi
done

# Now we need to put the url and the checksum in the Package.swift file.
# We have a template for this and do a search/replace.
sed "s+%%coreUrl%%+$coreUrl+g; s+%%swiftUIUrl%%+$swiftUIUrl+g; s+%%coreChecksum%%+$coreChecksum+g; s+%%swiftUIChecksum%%+$swiftUIChecksum+g; s+%%coreLibraryName%%+$coreLibraryName+g; s+%%swiftUILibraryName%%+$swiftUILibraryName+g;" "scripts/templates/package-template.swift" > Package.swift

# Print out for debugging purposes
cat Package.swift