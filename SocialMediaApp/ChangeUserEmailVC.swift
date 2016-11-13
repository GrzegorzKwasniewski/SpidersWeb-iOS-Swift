//
//  ChangeUserEmailVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 05/11/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase

class ChangeUserEmailVC: UIViewController {
    
    @IBOutlet var userEmail: UITextField!

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
    
    @IBAction func changeUserEmail(_ sender: AnyObject) {
        //var credential: FIRAuthCredential

        let user = FIRAuth.auth()?.currentUser
        
        if let email = self.userEmail.text {
            
            let newEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if RegEx.sharedInstance.validteEmailAddress(emailAddress: newEmail) {
                user?.updateEmail(self.userEmail.text!) { error in
                    if let error = error {
                        print("README: Can't change email")
                        print("README \(error)")
                    } else {
                        print("README: Email have been changed")
                        user?.sendEmailVerification() { error in
                            if let error = error {
                                print("README: Error while sending veryfication email")
                            } else {
                                print("README: Verification email send")
                            }
                        }
                    }
                }
            } else {
                // show info to the user
                print("README: This is not valid email")
            }
        }
    }
    
    @IBAction func removePopUp(_ sender: AnyObject) {
        removeAnimate()
    }
    
}
