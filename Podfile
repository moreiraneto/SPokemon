platform :ios, '11.1'

use_frameworks!

workspace 'SPokemon'

def data_pods
    pod 'Moya/RxSwift', '~> 13.0.1'
    pod 'RxSwift', '~> 4.0'
end

target 'Data' do
    project 'Modules/Data/Data.project'
    data_pods
end

def domain_pods
  pod 'RxSwift', '~> 4.0'
end

target 'Domain' do
    project 'Modules/Domain/Domain.project'
    pod 'SwiftJWT'
    domain_pods
end

def application_pods
    data_pods
    pod 'SwiftJWT'
    pod 'RxSwift', '~> 4.0'
    pod 'RxCocoa', '~> 4.0'
    pod 'SwiftLint'
    pod 'RxDataSources', '~> 3.1.0'
    pod 'Kingfisher'
end

target 'SPokemon' do
    project 'SPokemon.project'
    application_pods
end

target 'Common' do
    project 'Modules/Common/Common.project'
    pod 'Moya/RxSwift', '~> 13.0.1'
end

