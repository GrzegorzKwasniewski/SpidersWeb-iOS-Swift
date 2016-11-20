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
        
        let user = FIRAuth.auth()?.currentUser
        // is it safe???
        var credential: FIRAuthCredential!

        credential = FIREmailPasswordAuthProvider.credential(withEmail: email, password: password)
        user?.reauthenticate(with: credential) { error in
            if let error = error {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    func changeUserEmail(userNewEmail: String) {
        
        if let currentuser = FIRAuth.auth()?.currentUser {
            let newEmail = userNewEmail.trimmingCharacters(in: .whitespacesAndNewlines)
            if RegEx.sharedInstance.validteEmailAddress(emailAddress: newEmail) {
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
            } else {
                print("README: Verification email send")
            }
        }
    }
}
