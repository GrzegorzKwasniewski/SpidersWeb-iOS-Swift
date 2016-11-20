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
    
    @IBAction func changeUserEmail(_ sender: AnyObject) {
        let changeUserSettings = ChangeUserSettings()
        
        if let newUserEmail = self.userEmail.text {
            if !newUserEmail.isEmpty {
                changeUserSettings.changeUserEmail(userNewEmail: newUserEmail)
            } else {
                print("README: New user email filed is empty1")
            }
        } else {
            // info user that field can't be empty
            print("README: New user email filed is empty2")
        }
    }
    
    @IBAction func removePopUp(_ sender: AnyObject) {
        removeAnimate()
    }
    
}
