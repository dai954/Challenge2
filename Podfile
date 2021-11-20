# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

# Pods for Challenge2

target 'Challenge2' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

    pod 'RxSwift', '6.2.0'
    pod 'RxCocoa', '6.2.0'
    pod 'RxOptional'
    pod 'RxDataSources', '~> 5.0'
    pod 'Kingfisher', '~> 7.0'

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      if target.name == 'RxSwift'
        target.build_configurations.each do |config|
          if config.name == 'Debug'
            config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D', 'TRACE_RESOURCES']
          end
        end
      end
    end
  end

  target 'Challenge2Tests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RxBlocking', '6.2.0'
    pod 'RxTest', '6.2.0'
	
  end

end
