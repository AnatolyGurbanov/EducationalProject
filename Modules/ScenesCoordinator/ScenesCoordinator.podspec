Pod::Spec.new do |spec|
    spec.name         = "ScenesCoordinator"
    spec.version      = "0.0.1"
    spec.summary      = "Scenes Coordinator"
    spec.description  = <<-DESC
      ScenesCoordinator feature module
                   DESC
    spec.homepage     = "https://65apps.com"
    spec.license      = "BSD"
    spec.author       = { "Anatoly Gurbanov" => "agurbanov@65apps.com" }
    spec.platform     = :ios, "13.0"
    spec.swift_version = "5.0"
    spec.source       = { :path => "." }
    spec.source_files = "ScenesCoordinator/**/*.swift"
    spec.frameworks = "Foundation", "UIKit"  
    #
    spec.dependency "Routing"
    spec.dependency "PokemonsListScene"
end
