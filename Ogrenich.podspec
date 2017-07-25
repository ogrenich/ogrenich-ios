Pod::Spec.new do |s|

  s.name            = "Ogrenich"
  s.version         = "0.1.5"
  s.summary         = "Ogrenich iOS Framework"
  s.homepage        = "http://ogrenich.io"
  s.license         = "MIT"
  s.authors         = { "Andrey Ogrenich" => "andrey.ogrenich@gmail.com" }
  s.source          = { :git => "http://github.com/ogrenich/ogrenich-ios.git",
                        :tag => "#{s.version}" }

  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.source_files   = "Sources/Ogrenich/", "Sources/Ogrenich/**/*.{h,m,swift}"
    ss.framework      = "Foundation", "UIKit"
  end

  s.subspec "RxSwift" do |ss|
    ss.source_files   = "Sources/RxOgrenich/", "Sources/RxOgrenich/**/*.{h,m,swift}"
    ss.dependency "Ogrenich/Core"
    ss.dependency "RxSwift", "3.4.1"
    ss.dependency "RxCocoa", "3.4.1"
  end

  s.platform            = :ios, "9.0"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

end
