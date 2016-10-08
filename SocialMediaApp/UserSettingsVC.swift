//
//  UserSettingsVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 08/10/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase

class UserSettingsVC: UIViewController {
    
    
    @IBOutlet var userNameLabel: UILabel!
    
    @IBAction func changeUserName(_ sender: AnyObject) {
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            if let currentUser = user {
                let changeRequest = currentUser.profileChangeRequest()
                changeRequest.displayName = "Jane Q. User"
                //changeRequest.photoURL = NSURL(string: "https://example.com/jane-q-user/profile.jpg")
                changeRequest.commitChanges { error in
                    if let error = error {
                        print("README: Error while trying to change user data")
                    } else {
                        // Profile updated.
                    }
                }
            } else {
                print("REDAME: There's no user signed in")
            }
        }
    }
    
    @IBAction func BackButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            if let currentUser = user {
                // TO SET LATER let currentUserEmail = currentUser.email, let currentUserPhotoUrl = currentUser.photoURL
                let currentUserUid = currentUser.uid
                guard let currentUserName = currentUser.displayName else { print("README: Can't get user data from Firebase")
                    return
                }
                print("USERDATA: \(currentUserName) - \(currentUserUid)")
                self.userNameLabel.text = currentUserName
            } else {
                print("REDAME: There's no user signed in")
            }
        }
    }
}
