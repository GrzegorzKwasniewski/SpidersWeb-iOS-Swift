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
    static let login = TwitterLogin()
    
    func loginWithTwitter() {
        Twitter.sharedInstance().logIn() { (session, error) in
            if let session = session {
                // [START headless_twitter_auth]
                let credential = FIRTwitterAuthProvider.credential(withToken: session.authToken, secret: session.authTokenSecret)
                // [END headless_twitter_auth]
                FirebaseLogin.login.firebaseAuthentication(credential)
            } else {
                print("README: Error while authenticating with Twitter")
            }
        }
    }
}