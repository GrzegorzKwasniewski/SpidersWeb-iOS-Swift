# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'SocialMediaApp' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  link_with 'SocialMediaApp', 'SocialMediaApp-Dev'

  # Pods for SocialMediaApp and SocialMediaApp-Dev
  pod 'Firebase'
  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'Firebase/Database'
  pod 'Firebase/Storage'
  pod 'GoogleSignIn'
  pod 'FBSDKLoginKit'
  pod 'SwiftKeychainWrapper'
  pod 'TwitterKit'
  pod 'Fabric'
  pod 'KRProgressHUD'
  pod 'SwiftLint'

  target 'SocialMediaAppTests' do
    inherit! :search_paths
    
    pod 'Quick'
    pod 'Nimble'
    pod 'Firebase'
    
  end

end
