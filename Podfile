platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!

def external_pods
  use_frameworks!
  # Rx
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxDataSources'
  pod 'RxSwiftExt'
  pod 'RxFeedback'
  pod 'RxViewController'
  # Moya
  pod 'Moya/RxSwift'
  pod 'Moya'
end

def swinject
  pod 'Swinject'
end

def snapkit
 pod 'SnapKit'
end

def core_pods
    pod "Common", :path => "Modules/Common"
    pod "Constants", :path => "Modules/Constants"
    pod "DataManagers", :path => "Modules/DataManagers"
    pod "Extensions", :path => "Modules/Extensions"
    pod "Models", :path => "Modules/Models"
    pod "Networking", :path => "Modules/Networking"
end

def scenes_pods
    pod "PokemonsListScene", :path => "Modules/PokemonsListScene"
end

target 'EducationalProject' do
  use_frameworks!
  core_pods
  scenes_pods
  external_pods
  swinject
  snapkit
end
