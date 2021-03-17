platform :ios, '13.0'
use_frameworks!

def rxSwift
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxSwiftExt'
end

def moya
  pod 'Moya/RxSwift'
  pod 'Moya'
end

def swinject
  pod 'Swinject'
end

target 'EducationalProject' do
  rxSwift
  swinject
  pod 'SnapKit'
end

target 'Domain' do
  rxSwift
  moya
  swinject
end

target 'Networking' do
  rxSwift
  swinject
  moya
end
