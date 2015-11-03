#
# Be sure to run `pod lib lint SOKit.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SOKit"
  s.version          = “0.8.0”
  s.summary          = "A short description of SOKit."
  s.description      = <<-DESC
                       An optional longer description of SOKit

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/SoalHuang/SOKit.git"
  s.license          = 'MIT'
  s.author           = { “SoalHuang” => “sosoniceme@163.com” }
  s.source           = { :git => "https://github.com/SoalHuang/SOKit.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :iOS, ‘6.0’
  s.requires_arc = true

  #  s.frameworks = 'UIKit'
  #  s.dependency 'AFNetworking',
  #  s.dependency 'SDWebImage',
  #  s.dependency ‘FMDB’,
  #  s.dependency ‘WebViewJavascript’,
  #  s.dependency ‘HTML+AttributedString’,

end
