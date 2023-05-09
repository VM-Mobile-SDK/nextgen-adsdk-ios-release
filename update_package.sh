#!/bin/bash

# This script will update the swift package definition
# It requires two arguements:
# - github release
# - the file name of the asset of the release to be used; this is usually a zipped xcframework
# - the name of the library to use as part of the swift package declaration

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
coreUrl="$(gh release view $release --json assets -q ".assets[] | select(.name | test(\"$coreAssetName\")) | .apiUrl")"
swiftUIUrl="$(gh release view $release --json assets -q ".assets[] | select(.name | test(\"$swiftUIAssetName\")) | .apiUrl")"

# we will put this URL in the swift package declaration later
echo "URL for core asset: $coreUrl"
echo "URL for swiftUI asset: $swiftUIUrl"

# besides the URL, the swift package needs to include a checksum of the zip file
# to generate the checksum, we first download the asset

gh release download $release -p "$coreAssetName" --clobber

if [[ $? -ne 0 ]]; then
	echo "Failed to download the asset $coreAssetName, aborting"
	exit 1 # fail the action
else
	echo "Downloaded $coreAssetName"
fi

gh release download $release -p "$swiftUIAssetName" --clobber

if [[ $? -ne 0 ]]; then
	echo "Failed to download the asset $swiftUIAssetName, aborting"
	exit 1 # fail the action
else
	echo "Downloaded $swiftUIAssetName"
fi


# then we use swift package compute-checksum 
# this needs to be run in the directory containing the Package.swift file

touch Package.swift

coreChecksum="$(swift package compute-checksum $coreAssetName)"

if [ -z "$coreChecksum" ]; then
    echo "failed to calculate checksum for $coreAssetName"
    exit 1
else
	echo "checksum for $coreAssetName: $coreChecksum"
fi


swiftUIChecksum="$(swift package compute-checksum $swiftUIAssetName)"


if [ -z "$coreChecksum" ]; then
    echo "failed to calculate checksum for $swiftUIAssetName"
    exit 1
else
	echo "checksum for $swiftUIAssetName: $swiftUIChecksum"
fi


# Now we need to put the url and the checksum in the Package.swift file
# We have a template for this and do a search/replace 
sed "s+%%coreUrl%%+$coreUrl+g; s+%%swiftUIUrl%%+$swiftUIUrl+g; s+%%coreChecksum%%+$coreChecksum+g; s+%%swiftUIChecksum%%+$swiftUIChecksum+g; s+%%coreLibraryName%%+$coreLibraryName+g; s+%%swiftUILibraryName%%+$swiftUILibraryName+g;" Package_Template.swift > Package.swift

cat Package.swift
