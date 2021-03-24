Pod::Spec.new do |spec|
    spec.name         = "UseCases"
    spec.version      = "0.0.1"
    spec.summary      = "UseCases"
    spec.description  = <<-DESC
        UseCases feature module
                     DESC
    spec.homepage     = "https://65apps.com"
    spec.license      = "BSD"
    spec.author       = { "Anatoly Gurbanov" => "agurbanov@65apps.com" }
    spec.platform     = :ios, "11.0"
    spec.swift_version = "5.0"
    spec.source       = { :path => "." }
    spec.source_files  = "UseCases/**/*.swift"
    spec.frameworks = "Foundation", "UIKit"
    spec.dependency "RxSwift"
    spec.dependency "Models"
    spec.dependency "Networking"
    spec.dependency "DataManagers"
end
