Pod::Spec.new do |spec|
  spec.name         = "Extensions"
  spec.version      = "0.0.1"
  spec.summary      = "Extensions"
  spec.description  = <<-DESC
      Extensions feature module
                   DESC
  spec.homepage     = "https://65apps.com"
  spec.license      = "BSD"
  spec.author       = { "Anatoly Gurbanov" => "agurbanov@65apps.com" }
  spec.platform     = :ios, "12.0"
  spec.swift_version = "5.0"
  spec.source       = { :path => "." }
  spec.source_files  = "Extensions/**/*.swift"
  spec.frameworks = "Foundation", "UIKit"
  spec.dependency "RxSwift"
  spec.dependency "RxCocoa"
  spec.dependency "Common"
end
