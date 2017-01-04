//
//  SigInWithEmailVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 04/01/17.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase

class SigInWithEmailVC: UIViewController {
    
    @IBOutlet var emailField: RoundedBorderTextField!
    @IBOutlet var passwordField: RoundedBorderTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInWithEmail(_ sender: AnyObject) {
        EmailLogin.sharedInstance.signInWithEmail(emailField: emailField, passwordField: passwordField)
    }
}
