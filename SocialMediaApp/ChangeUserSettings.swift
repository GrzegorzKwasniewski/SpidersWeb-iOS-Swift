//
//  ChangeUserSettings.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 20/11/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import Firebase

class ChangeUserSettings {
    
    func reAuthenticateUserWithEmail(email: String, password: String, completion: @escaping (Bool) -> Void) {
        
        // is it safe???
        var credential: FIRAuthCredential!
        
        if let currentUser = FIRAuth.auth()?.currentUser {
            credential = FIREmailPasswordAuthProvider.credential(withEmail: email, password: password)
            currentUser.reauthenticate(with: credential) { error in
                if let error = error {
                    print("README: Error while trying to reauthenticate user")
                    print("README: \(error)")
                    completion(false)
                } else {
                    completion(true)
                }
            }
        }
    }
    
    func changeUserDisplayName(newDisplayName: String, completion: @escaping (Bool) -> Void) {
        
        if RegEx.sharedInstance.validteString(emailAddress: newDisplayName, typeOfString: .userDisplayName) {
            if let currentUser = FIRAuth.auth()?.currentUser {
                let changeRequest = currentUser.profileChangeRequest()
                changeRequest.displayName = newDisplayName
                changeRequest.commitChanges { error in
                    if let error = error {
                        print("README: Error while trying to change user data")
                        print("README \(error)")
                        completion(false)
                    } else {
                        // inform user about succes of update - supply any additional info like when changes will be visible
                        // Profile updated.
                        completion(true)
                    }
                }
            } else {
                print("REDAME: There's no user signed in")
                completion(false)
            }
        }
    }
    
    func changeUserEmail(userNewEmail: String) {
        
        if let currentuser = FIRAuth.auth()?.currentUser {
            let newEmail = userNewEmail.trimmingCharacters(in: .whitespacesAndNewlines)
            if RegEx.sharedInstance.validteString(emailAddress: newEmail, typeOfString: .emailAddress) {
                currentuser.updateEmail(userNewEmail) { error in
                    if let error = error {
                        print("README: Can't change email")
                        print("README \(error)")
                    } else {
                        print("README: Email have been changed")
                        self.sendEmailVerificationToUser(user: currentuser)
                    }
                }
            } else {
                // show info to the user
                print("README: This is not valid email")
            }
        }
    }
    
    func sendEmailVerificationToUser(user: FIRUser) {
        user.sendEmailVerification() { error in
            if let error = error {
                print("README: Error while sending veryfication email")
                print("README \(error)")
            } else {
                print("README: Verification email send")
            }
        }
    }
}
