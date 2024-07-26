#!/bin/bash

# This is part of the automated deployment of the AdSDK. 
# If you are an user of the SDK you can ignore this file.
#
# This script will update podspecs files definition
# It requires five arguements:
# 1. the release version tag
# 2. the name of the core library to use as part of the podspec declaration
# 3. the url to the core library artifact; this is usually a zipped xcframework
# 4. the name of the swiftui library to use as part of the podspec declaration
# 5. the url to the swiftui library artifact; this is usually a zipped xcframework
if [ $# -lt 5 ]; then 
  	echo "Please supply release versin, library names, and urls to the library artifacts for the core and swiftUI libraries."
	echo "Usage: $0 <release version> <core library name> <core asset url> <swiftui library name> <swiftui asset url>"
	echo "The version and library name will be used in the podspecs declaration." 
	echo "The url to the core library artifact is the URL of the xcframework zip attachet to the release."
  	exit 1
fi

releaseVersion=$1
coreLibraryName=$2
coreUrl=$3
swiftUILibraryName=$4
swiftUIUrl=$5

# Move to the AdSDKCore.podspec file
cd ..
touch AdSDKCore.podspec

# Now we need to put the url and the checksum in the AdSDKCore.podspec file
# We have a template for this and do a search/replace
sed "s+%%version%%+$releaseVersion+g; s+%%coreUrl%%+$coreUrl+g; s+%%swiftUIUrl%%+$swiftUIUrl+g; s+%%coreLibraryName%%+$coreLibraryName+g; s+%%swiftUILibraryName%%+$swiftUILibraryName+g;" Scripts/Templates/AdSDKCore_Template.podspec > AdSDKCore.podspec
echo "\n\nAdSDKCore.podspec updated:\n\n"
cat AdSDKCore.podspec

# Move to the AdSDKSwiftUI.podspec file
touch AdSDKSwiftUI.podspec

# Now we need to put the url and the checksum in the AdSDKSwiftUI.podspec file
# We have a template for this and do a search/replace
sed "s+%%version%%+$releaseVersion+g; s+%%coreUrl%%+$coreUrl+g; s+%%swiftUIUrl%%+$swiftUIUrl+g; s+%%coreLibraryName%%+$coreLibraryName+g; s+%%swiftUILibraryName%%+$swiftUILibraryName+g;" Scripts/Templates/AdSDKSwiftUI_Template.podspec > AdSDKSwiftUI.podspec
echo "\n\nAdSDKSwiftUI.podspec updated:\n"
cat AdSDKSwiftUI.podspec