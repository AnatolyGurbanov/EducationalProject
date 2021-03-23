Pod::Spec.new do |spec|
  spec.name         = "DataManagers"
  spec.version      = "0.0.1"
  spec.summary      = "DataManagers"
  spec.description  = <<-DESC
  DataManagers feature module
                   DESC
  spec.homepage     = "https://65apps.com"
  spec.license      = "BSD"
  spec.author       = { "Anatoly Gurbanov" => "agurbanov@65apps.com" }
  spec.platform     = :ios, "11.0"
  spec.swift_version = "5.0"
  spec.source       = { :path => "." }
  spec.source_files  = "DataManagers/**/*.swift"
  spec.frameworks = "Foundation"
  spec.dependency "RxSwift"
  ##
  spec.dependency 'Networking'
  spec.dependency 'Models'
end
