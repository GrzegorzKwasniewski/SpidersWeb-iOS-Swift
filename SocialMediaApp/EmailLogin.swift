//
//  EmailLogin.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 03/11/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import Firebase

class EmailLogin {

    static let sharedInstance = EmailLogin()
    weak var delegate: CompleteSignInWthFirebaseDelegate?
    
    func signInWithEmail(emailField: UITextField, passwordField: UITextField) {
            if let email = emailField.text, let password = passwordField.text {
                FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                    if error == nil {
                        print("README: Email user authenticated with Firebase")
                        if let firebaseUser = user {
                            var firebaseUserName = ""
                            var userPhotoUrl: String!
                            
                            if let userName = firebaseUser.displayName {
                                firebaseUserName = userName
                            } else {
                                firebaseUserName = "New user"
                            }
                            
                            if let photoUrl = firebaseUser.photoURL {
                                userPhotoUrl = "\(photoUrl)"
                            } else {
                                userPhotoUrl = defaultAvatarUrl
                            }
                            
                            let userData: Dictionary<String, String> = [
                                "provider": firebaseUser.providerID,
                                "userName": firebaseUserName,
                                "photoUrl": userPhotoUrl
                            ]
                            self.delegate?.completeSignIn(id: firebaseUser.uid, userData: userData)
                        }
                    } else {
                        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                print("README: Unable to authenticate with Firebasr using email")
                            } else {
                                print("README: Created user with new email")
                                if let firebaseUser = user {
                                    var firebaseUserName = ""
                                    var userPhotoUrl: String!
                                    
                                    if let userName = firebaseUser.displayName {
                                        firebaseUserName = userName
                                    } else {
                                        firebaseUserName = "New user"
                                    }
                                    
                                    if let photoUrl = firebaseUser.photoURL {
                                        userPhotoUrl = "\(photoUrl)"
                                    } else {
                                        userPhotoUrl = defaultAvatarUrl
                                    }
                                    
                                    let userData: Dictionary<String, String> = [
                                        "provider": firebaseUser.providerID,
                                        "userName": firebaseUserName,
                                        "photoUrl": userPhotoUrl
                                    ]
                                    self.delegate?.completeSignIn(id: firebaseUser.uid, userData: userData)
                                }
                            }
                        })
                    }
                })
            }
    }
}
