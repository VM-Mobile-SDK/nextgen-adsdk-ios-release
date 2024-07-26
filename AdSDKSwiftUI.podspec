# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html

Pod::Spec.new do |s|
  s.name                  = "AdSDKSwiftUI"
  s.version               = "5.4.0"
  s.summary               = "SwiftUI library for working with Adition Ad Server."
  s.description           = <<-DESC
                            Manage, display, and create your custom advertisements on iOS using ADITION Ad server and cutting-edge technologies such as Combine, Modern Concurrency, and SwiftUI based.

                            To use the ADITION AdSDK the application developer will need to acquire the AdSDK library as well as networkId and contentUnit pairs from an ADITION customer.
                            DESC
  s.homepage              = "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release"
  s.license               = { :type => "custom", :file => "LICENSE.txt" }
  s.author                = { "Virtual Minds GmbH" => "mobilesdk@virtualminds.com" }
  s.ios.deployment_target = '14.0'
  s.source                = { :http => "https://github.com/VM-Mobile-SDK/nextgen-adsdk-ios-release/releases/download/5.4.0/AdSDKSwiftUI-5.4.0.zip" }
  
  s.dependency "AdSDKCore", "5.4.0"

  s.ios.vendored_frameworks = "AdSDKSwiftUI.xcframework"
end