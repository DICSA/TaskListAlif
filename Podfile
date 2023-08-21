source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '16.0'

target 'TaskList' do
  use_frameworks!

 pod 'SnapKit', '~> 5.0.0'
 pod 'SwiftGifOrigin', '~> 1.7.0'
 pod 'KeychainSwift', '~> 20.0'

end

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.0'
               end
          end
   end
end
