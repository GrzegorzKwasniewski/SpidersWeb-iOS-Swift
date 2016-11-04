//
//  FacebookLogin.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 04/11/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class FacebookLogin {

    static let sharedInstance = FacebookLogin()
    
    func signInWithFacebook() {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: nil) { (result, error) in
            
            if error != nil {
                print("README: Can't get data form Facebook. Return ERROR: \(error)")
            } else if result?.isCancelled == true { // if user deny permissions
                print("README: User cancelled user authentication")
            } else {
                print("README: Successfuly authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                FirebaseLogin.sharedInstance.firebaseAuthentication(credential)
            }
        }

    }

}
