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
    
    // MARK: Fields ++++++++++++++++++++++++++++++++++++++++
    
    static let sharedInstance = EmailLogin()
    
    weak var delegate: CompleteSignInWithFirebaseDelegate?
    weak var popUpDelegate: ShowPopUp?
    
    // MARK: Custom Functions ++++++++++++++++++++++++++++++++++++++++
    
    func signInWithEmail(emailField: UITextField, passwordField: UITextField) {
        
        if let email = emailField.text, let password = passwordField.text {
            
            // Authtenticate user with email
            
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                
                if let error = error {
                    self.popUpDelegate?.authenticationFailed(withMessage: error.localizedDescription)
                    return
                }
                
                if let firebaseUser = user {
                    self.delegate?.completeSignIn(userID: firebaseUser.uid, userData: self.assignDataToUser(firebaseUser: firebaseUser, isNewUser: false))
                }
            })
        }
    }
    
    func createUserWithEmail(emailField: UITextField, passwordField: UITextField) {
        
        if let email = emailField.text, let password = passwordField.text {
            
            FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                
                if let error = error {
                    self.popUpDelegate?.authenticationFailed(withMessage: error.localizedDescription)
                    return
                }
                
                guard let newUser = user else {
                    return
                }
                
                FirebaseDataService.ds.createFirebaseDBUser(uid: newUser.uid, userData: self.assignDataToUser(firebaseUser: newUser, isNewUser: true))
                
                self.popUpDelegate?.authenticationSuccess()
                
            })
        }
    }
    
    func assignDataToUser(firebaseUser user: FIRUser, isNewUser newUser: Bool) -> [String: String] {
        
        if newUser {
            
            // TODO: Move this block to separate function
            let newUserName = UserMessages.userName
            let photoUrl = URLS.defaultAvatar
            
            // assign new data to Firebase bulit in user
            setValuesForNewUserProfile(withName: newUserName, photoUrl: photoUrl)
            
            let newUserData: [String: String] = [
                "provider": user.providerID,
                "userName": newUserName,
                "photoUrl": photoUrl
            ]
            
            return newUserData
            
        } else {
            
            // TODO: Move this block to separate function
            var firebaseUserName = ""
            var userPhotoUrl = ""
            
            if let userName = user.displayName {
                firebaseUserName = userName
            }
            
            if let photoUrl = user.photoURL {
                userPhotoUrl = "\(photoUrl)"
            }
            
            let existingUserData: [String: String] = [
                "provider": user.providerID,
                "userName": firebaseUserName,
                "photoUrl": userPhotoUrl
            ]
            
            return existingUserData
            
        }
    }
    
    func setValuesForNewUserProfile(withName name: String, photoUrl url: String) {
        let changeRequest = FIRAuth.auth()?.currentUser?.profileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.photoURL = URL(fileURLWithPath: url)
        changeRequest?.commitChanges { (error) in
            print(error?.localizedDescription ?? "User Data Updated")
        }
    }
}

