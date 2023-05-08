#!/bin/bash

# This script will update the swift package definition
# It requires two arguements:
# - github release
# - the file name of the asset of the release to be used; this is usually a zipped xcframework
# - the name of the library to use as part of the swift package declaration

if [ $# -lt 3 ]; then 
  	echo "Please supply a github release and an asset name"
	echo "Usage: $0 <github release> <library name> <asset filename>"
	echo "The library name will be used in the Swift package declaration as the package name and target name" 
	echo "The library name must also match the directory name containing the swift package declaration"
   	echo "The asset filename is the name of the xcframework zip attached to the release"   
  	exit 1
fi

release=$1
libraryName=$2
assetName=$3

# first, check if the given release exists 

tagName="$(gh release view $release --json tagName  -q '.tagName')"

if [[ $? -ne 0 ]]; then
	echo "Failed to get the tag name for release $release, aborting"
	exit 1 # fail the action
else
	echo "Tag name is $tagName"
fi


# github has a command line tool called gh
# we use this to get the list of assets associated with a release
# one of these assets is the zip file containing the xcframework asset
# we pass the output of gh through a jq filter to only return those asset urls that mach the library name
url="$(gh release view $release --json assets -q ".assets[] | select(.name | test(\"$assetName\")) | .apiUrl")"

# we will put this URL in the swift package declaration later
echo "URL for asset: $url"

# besides the URL, the swift package needs to include a checksum of the zip file
# to generate the checksum, we first download the asset

gh release download $release -p "$assetName" --clobber

if [[ $? -ne 0 ]]; then
	echo "Failed to download the asset $assetName, aborting"
	exit 1 # fail the action
else
	echo "Downloaded $assetName"
fi


# then we use swift package compute-checksum 
# this needs to be run in the directory containing the Package.swift file

touch Package.swift
checksum="$(swift package compute-checksum AdSDKCore.xcframework.zip)"
echo "checksum: $checksum"

# Now we need to put the url and the checksum in the Package.swift file
# We have a template for this and do a search/replace 
sed "s+%%url%%+$url+g; s+%%checksum%%+$checksum+g; s+%%name%%+$libraryName+g;" Package_Template.swift > Package.swift

echo "libraryName: $libraryName"
