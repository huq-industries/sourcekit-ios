#
# Be sure to run `pod lib lint SourceKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = "SourceKitAds"
s.version          = "1.2.4"
s.summary          = "The SourceKit Library is the iOS SDK for use with the Huq physical analytics products."

s.description      = <<-DESC
SourceKit by Huq is the fastest way to find insights and be inspired by what your users get up to in the physical world, using Huq's Physical Analytics platform for mobile app publishers.

-Learn when and how your users shop, work and relax
-Build and manage insights using Huq's analytics tools
-Use Huq to power campaigns and personalise content
DESC

s.homepage         = "https://github.com/huq-industries/sourcekit-ios"
s.license          = 'All rights reserved'
s.author           = { "Huq Industries" => "isambard@huq.io" }
s.source           = { :git => "https://github.com/huq-industries/sourcekit-ios.git", :tag=>s.version.to_s}
s.frameworks        = 'CoreLocation','SystemConfiguration','CoreTelephony','AdSupport'

s.platform     = :ios, '7.0'
s.requires_arc = true
s.ios.vendored_frameworks = 'SourceKit/Frameworks/SourceKit.framework'
s.deprecated = true

end
