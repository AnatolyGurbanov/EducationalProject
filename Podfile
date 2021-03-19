ENV['COCOAPODS_DISABLE_STATS'] = 'true'
platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!

install! 'cocoapods',
:deterministic_uuids => false,
:clean => true,
:disable_input_output_paths => true,
:warn_for_unused_master_specs_repo => false

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
    pod "Networking", :path => "Modules/Networking"
    pod "Models", :path => "Modules/Models"
    pod "Constants", :path => "Modules/Constants"
    pod "DataManagers", :path => "Modules/DataManagers"
end

target 'EducationalProject' do
  use_frameworks!
  inherit! :search_paths
  core_pods
  external_pods
  swinject
  snapkit
end
