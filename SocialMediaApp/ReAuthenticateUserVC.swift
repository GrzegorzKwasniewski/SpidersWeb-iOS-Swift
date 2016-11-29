//
//  ReAuthenticateUserVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 05/11/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase

class ReAuthenticateUserVC: UIViewController {
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimate()
    }
    
    @IBAction func reAuthenticateUser(_ sender: AnyObject) {
        
        let changeUserSettings = ChangeUserSettings()
        
        if let userEmail = emailField.text, let userPassword = passwordField.text {
            if !userEmail.isEmpty && !userPassword.isEmpty {
                changeUserSettings.reAuthenticateUserWithEmail(email: userEmail, password: userPassword) { (success) in
                    if (success) {
                        print("README: User reauthenticated")
                        self.removeAnimate()
                    } else {
                        print("README: Can't reauthenticated the user")
                        // inform user about an error
                        // An error happened.
                    }
                }
            } else {
                print("README: Try to reAuth but fields are empty1")
            }
        } else {
            print("README: Try to reAuth but fields are empty2")
        }
    }
    
    
    @IBAction func closePopUpView(_ sender: AnyObject) {
        removeAnimate()
    }
}
