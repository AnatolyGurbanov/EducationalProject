Pod::Spec.new do |spec|
  spec.name         = "Models"
  spec.version      = "0.0.1"
  spec.summary      = "Models"
  spec.description  = <<-DESC
      Models feature module
                   DESC
  spec.homepage     = "https://65apps.com"
  spec.license      = "BSD"
  spec.author       = { "Anatoly Gurbanov" => "agurbanov@65apps.com" }
  spec.platform     = :ios, "13.0"
  spec.swift_version = "5.0"
  spec.source       = { :path => "." }
  spec.source_files  = "Models/**/*.swift"
  spec.frameworks = "Foundation"
  spec.dependency "Extensions"
end

