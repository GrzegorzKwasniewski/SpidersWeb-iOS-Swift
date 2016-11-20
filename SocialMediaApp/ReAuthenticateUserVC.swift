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
        
        changeUserSettings.reAuthenticateUserWithEmail(email: self.emailField.text!, password: self.passwordField.text!) { (success) in
            if (success) {
                print("README: User reauthenticated")
                self.removeAnimate()
            } else {
                print("README: Can't reauthenticated the user")
                // inform user about an error
                // An error happened.
            }
        }
    }
    
    
    @IBAction func closePopUpView(_ sender: AnyObject) {
        removeAnimate()
    }
}
