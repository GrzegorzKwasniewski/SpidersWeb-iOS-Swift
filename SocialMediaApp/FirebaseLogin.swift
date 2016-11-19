//
//  FirebaseLogin.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 01/11/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase

class FirebaseLogin {
    
    static let sharedInstance = FirebaseLogin()
    weak var delegate: CompleteSignInWthFirebaseDelegate?
    
    func firebaseAuthentication(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("README: Unable to authenticate with Firebase. ERROR: \(error)")
            } else {
                print("README: Succesfuly authenticeted with Firebase")
                // store user UID using Keychains
                if let firebaseUser = user {
                    
                var firebaseUserName = ""
                    
                if let userName = firebaseUser.displayName {
                    firebaseUserName = userName
                }

                let userData: Dictionary<String, String> = [
                        "provider": credential.provider,
                        "userName": firebaseUserName,
                        "photoUrl": String(describing: firebaseUser.photoURL)
                    ]
                        
                self.delegate?.completeSignIn(id: firebaseUser.uid, userData: userData)
                }
            }
        })
    }
}
