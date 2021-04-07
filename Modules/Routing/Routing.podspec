Pod::Spec.new do |spec|
  spec.name         = "Routing"
  spec.version      = "0.0.1"
  spec.summary      = "Routing module"
  spec.description  = <<-DESC
    Routing feature module
                   DESC
  spec.homepage     = "https://65apps.com"
  spec.license      = "BSD"
  spec.author       = { "Anatoly Gurbanov" => "agurbanov@65apps.com" }
  spec.platform     = :ios, "13.0"
  spec.swift_version = "5.0"
  spec.source       = { :path => "." }
  spec.source_files  = "Routing/**/*.swift"
  spec.frameworks = "Foundation", "UIKit"
  
  spec.dependency "Constants"

end
