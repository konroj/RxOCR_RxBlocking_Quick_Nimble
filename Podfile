# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'OCReact' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for OCReact
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'SwiftyTesseract'
  pod 'RxRealm'
  pod 'SnapKit'

  target 'OCReactTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick'
    pod 'Nimble'
    pod 'RxBlocking'
  end

end

post_install do | installer |
  swift4 = ['SwiftyTesseract']
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if swift4.include?(target.name)
        config.build_settings['SWIFT_VERSION'] = '4.2'
      end
    end
  end
  
end
