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

    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished) {
                    self.view.removeFromSuperview()
                }
        })
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
