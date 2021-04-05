Pod::Spec.new do |spec|
    spec.name         = "Common"
    spec.version      = "0.0.1"
    spec.summary      = "Common objects and structures"
    spec.description  = <<-DESC
      Common feature module
                   DESC
    spec.homepage     = "https://65apps.com"
    spec.license      = "BSD"
    spec.author       = { "Anatoly Gurbanov" => "agurbanov@65apps.com" }
    spec.platform     = :ios, "12.0"
    spec.swift_version = "5.0"
    spec.source       = { :path => "." }
    spec.source_files = "Common/**/*.swift"
    spec.frameworks = "Foundation", "UIKit"
    spec.dependency "RxSwift"
    spec.dependency "RxCocoa"
    spec.dependency "RxDataSources"
    spec.dependency "Differentiator"
end
