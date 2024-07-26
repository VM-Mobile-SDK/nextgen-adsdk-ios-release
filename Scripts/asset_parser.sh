#!/bin/bash

# This is part of the automated deployment of the AdSDK. 
# If you are an user of the SDK you can ignore this file.
#
# This script will return:
# 1. library asset URL
# 2. library asset checksum
# 
# You can get this values like that:
# ```
# output=$(./asset_parser.sh x.x.x asset_name)
# result=$(echo "$output" | grep "RESULT:")
# assetUrl=$(echo $result | awk '{print $2}')
# checksum=$(echo $result | awk '{print $3}')
# ```
#
# It requires two arguements:
# 1. github release version
# 2. the file name of the library asset of the release to be used; this is usually a zipped xcframework
if [ $# -lt 2 ]; then 
  	echo "Please supply a github release, and an asset name for the library."
	echo "Usage: $0 <github release> <asset filename>"
	echo "The asset filename is the name of the xcframework zip attached to the release."
  	exit 1
fi

release=$1
assetName=$2

# Github has a command line tool called gh.
# We use this to get the list of assets associated with a release.
# One of these assets is the zip file containing the xcframework asset.
# We pass the output of gh through a jq filter to only return those asset urls that mach the library name.
assetUrl="$(gh release view $release --json assets -q ".assets[] | select(.name | test(\"$assetName\")) | .url")"
echo "Asset URL found: $assetUrl"

# Besides the URL, the swift package needs to include a checksum of the zip file.
# This needs to be run in the directory containing the Package.swift file.
cd ..

# To generate the checksum, we first download the asset:
gh release download $release -p "$assetName" --clobber

if [[ $? -ne 0 ]]; then
	echo "Failed to download the asset $assetName, aborting"
	exit 1 # fail the action
else
	echo "Downloaded $assetName"
fi

# Then we use swift package compute-checksum.
checksum="$(swift package compute-checksum $assetName)"

if [ -z "$checksum" ]; then
    echo "failed to calculate checksum for $assetName"
    exit 1
else
	echo "checksum for $assetName: $checksum"
fi

# Remove loaded artifact from local.
rm $assetName

# Return result via echo.
echo "RESULT: $assetUrl $checksum"