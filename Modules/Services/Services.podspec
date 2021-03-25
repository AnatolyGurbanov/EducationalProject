Pod::Spec.new do |spec|
    spec.name         = "Services"
    spec.version      = "0.0.1"
    spec.summary      = "Data Services"
    spec.description  = <<-DESC
      Services feature module
                   DESC
    spec.homepage     = "https://65apps.com"
    spec.license      = "BSD"
    spec.author       = { "Anatoly Gurbanov" => "agurbanov@65apps.com" }
    spec.platform     = :ios, "11.0"
    spec.swift_version = "5.0"
    spec.source       = { :path => "." }
    spec.source_files = "Services/**/*.swift"
    spec.frameworks = "Foundation", "UIKit"
    spec.dependency "DataManagers"
    spec.dependency "RxSwift"
    spec.dependency "Models"
    spec.dependency "Extensions"
end
