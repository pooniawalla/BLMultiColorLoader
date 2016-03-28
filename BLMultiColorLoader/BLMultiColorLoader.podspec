Pod::Spec.new do |s|
s.name             = "BLMultiColorLoader"
s.version          = "0.1.2"
s.summary           = "This is the pod version of BLMultiColorHeader."
s.description      = <<-DESC
Simple, easy to use, Multi coloured and customisable loading indicator (loader) for iOS applications.
DESC

s.homepage         = "https://github.com/BLPoonia/BLMultiColorLoader"
s.screenshots      = "https://raw.githubusercontent.com/BLPoonia/BLMultiColorLoader/master/Screens/loader_screenshot.gif"
s.license          = 'MIT'
s.author           = { "Babulal Poonia" => "poonia.nitrkl@gmail.com", "Contribution - Herrick Wolber" => "wolbereric@yahoo.fr" }
s.source           = { :git => "https://github.com/BLPoonia/BLMultiColorLoader.git", :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/__poonia' 

s.platform     = :ios, '7.0'
s.requires_arc = true

s.source_files = 'Pod/Classes/**/*'
s.resource_bundles = {
'BLMultiColorLoader' => ['Pod/Assets/*.png']
}
s.public_header_files = 'Pod/Classes/**/*.h'
# s.source_files = 'Classes/**/*'
# s.resource_bundles = {
# 'BLMultiColorLoader' => ['Assets/*.png']
# }
# s.public_header_files = 'Classes/**/*.h'
s.frameworks = 'UIKit'
end
