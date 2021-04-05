Pod::Spec.new do |spec|
  spec.name         = "PokemonsListScene"
  spec.version      = "0.0.1"
  spec.summary      = "PokemonsListScene"
  spec.description  = <<-DESC
      PokemonsListScene feature module
                   DESC
  spec.homepage     = "https://65apps.com"
  spec.license      = "BSD"
  spec.author       = { "Anatoly Gurbanov" => "agurbanov@65apps.com" }
  spec.platform     = :ios, "12.0"
  spec.swift_version = "5.0"
  spec.source       = { :path => "." }
  spec.source_files  = "PokemonsListScene/**/*.swift"
  spec.frameworks = "Foundation", "UIKit"
  spec.dependency "RxSwift"
  spec.dependency "RxViewController"
  spec.dependency "RxDataSources"
  spec.dependency "SnapKit"
  ##
  spec.dependency "Extensions"
  spec.dependency "Common"
  spec.dependency "UseCases"
  
end
