#
# Be sure to run `pod lib lint ZoomyHeader.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZoomyHeader'
  s.version          = '0.1.3'
  s.summary          = 'A nice image header cell that zooms as you scroll up'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Zoomy header is a way to add an image cell to your UITableView that will zoom in as you scroll up, similar to Twitter and other apps. It is simple to implement with just a few lines of code!
                       DESC

  s.homepage         = 'https://github.com/logansease/ZoomyHeader'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Logan Sease' => 'lsease@gmail.com' }
  s.source           = { :git => 'https://github.com/logansease/ZoomyHeader.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/logansease'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ZoomyHeader/Classes/**/*'
  
   s.resource_bundles = {
     'ZoomyHeader' => 'ZoomyHeader/Classes/**/*.xib'
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
