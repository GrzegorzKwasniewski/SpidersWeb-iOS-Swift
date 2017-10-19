# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

def myPods
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
end

target 'SocialMediaApp' do
  use_frameworks!
  
    myPods

end

target 'SocialMediaApp-Dev' do
    use_frameworks!
    
    myPods
    
end

target 'SocialMediaAppTests' do
    use_frameworks!
    
    pod 'Quick'
    pod 'Nimble'
    pod 'Firebase'
    
end

target 'SocialMediaAppIntegrationTest' do
    use_frameworks!
    
    pod 'KIF'
    pod 'Nimble'
    pod 'Firebase'
    
end
