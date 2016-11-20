//
//  ChangeUserNamePopUp.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 05/11/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase

class ChangeUserNamePopUpVC: UIViewController {
    
    @IBOutlet var userName: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimate()
    }
    
    @IBAction func changeUserName(_ sender: AnyObject) {
        
        // Validate user name
        
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            if let currentUser = user {
                let changeRequest = currentUser.profileChangeRequest()
                changeRequest.displayName = self.userName.text
                changeRequest.commitChanges { error in
                    if let error = error {
                        print("README: Error while trying to change user data")
                    } else {
                        // inform user about succes of update - supply any additional info like when changes will be visible
                        // Profile updated.
                    }
                }
            } else {
                print("REDAME: There's no user signed in")
            }
        }
    }
    
    @IBAction func removePopUp(_ sender: AnyObject) {
        removeAnimate()
    }

}
