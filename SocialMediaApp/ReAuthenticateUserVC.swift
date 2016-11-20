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
        
        let user = FIRAuth.auth()?.currentUser
        var credential: FIRAuthCredential!
        
        if let userEmail = self.emailField.text, let userPassword = self.passwordField.text {
            credential = FIREmailPasswordAuthProvider.credential(withEmail: userEmail, password: userPassword)
            user?.reauthenticate(with: credential) { error in
                if let error = error {
                    print("README: Can't reauthenticated the user")
                    print("README: \(error)")
                    // inform user about an error
                    // An error happened.
                } else {
                    print("README: User reauthenticated")
                    self.removeAnimate()
                }
            }
        }
    }
    
    
    @IBAction func closePopUpView(_ sender: AnyObject) {
        removeAnimate()
    }
}
