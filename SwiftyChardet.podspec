Pod::Spec.new do |s|
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.name         = "SwiftyChardet"
  s.version      = "1.0.2"
  s.summary      = "SwiftyChardet try to detect the correct encoding from an NSData instance."
  s.homepage     = "https://github.com/agilewalker/SwiftyChardet"
  s.license 	 = { :type => "GPL", :file => "LICENSE" }
  s.author       = { "agilewalker" => "wuhuiyuan@gmail.com" }
  s.source       = { :git => "https://github.com/agilewalker/SwiftyChardet.git", :tag => s.version }
  s.source_files = "SwiftyChardet/**/*.{swift}"
end
