Pod::Spec.new do |s|
  s.platform = :ios
  s.ios.deployment_target = "8.0"
  s.name         = "SwiftyChardet"
  s.version      = "1.0.0"
  s.summary      = "SwiftyChardet try to detect the correct encoding from an NSData instance."
  s.homepage     = "https://github.com/agilewalker/SwiftyChardet"
  s.license 	 = { :type => "GPL", :file => "LICENSE" }
  s.author       = { "agilewalker" => "wuhuiyuan@gmail.com" }
  s.source       = { :git => "https://github.com/agilewalker/SwiftyChardet.git", :tag => "1.0.0" }
  s.source_files = "SwiftyChardet/**/*.{swift}"
end
