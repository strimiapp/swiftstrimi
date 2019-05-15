# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'Strimi' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Strimi
  pod 'AWSCore', '~> 2.9.0'
  pod 'AWSAppSync', '~> 2.10.0'
  pod 'AWSMobileClient', '~> 2.9.0'      # Required dependency
  pod 'AWSAuthUI', '~> 2.9.0'            # Optional dependency required to use drop-in UI
  pod 'AWSUserPoolsSignIn', '~> 2.9.0'   # Optional dependency required to use drop-in UI
  target 'StrimiTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'StrimiUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
