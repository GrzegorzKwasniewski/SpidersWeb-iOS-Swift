//
//  TwitterLogin.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 01/11/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase
import TwitterKit

class TwitterLogin {
    
    static let sharedInstance = TwitterLogin()
    
    func signInWithTwitter() {
        Twitter.sharedInstance().logIn() { (session, error) in
            if let session = session {
                // [START headless_twitter_auth]
                authProvider = .Twitter
                let credential = FIRTwitterAuthProvider.credential(withToken: session.authToken, secret: session.authTokenSecret)
                // [END headless_twitter_auth]
                FirebaseLogin.sharedInstance.firebaseAuthentication(credential)
            } else {
                print("README: Error while authenticating with Twitter")
            }
        }
    }
}
