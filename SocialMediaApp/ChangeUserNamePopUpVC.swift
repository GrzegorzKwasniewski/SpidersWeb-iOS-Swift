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
        
        let changeUserSettings = ChangeUserSettings()
        
        if let userName = userName.text {
            if !userName.isEmpty {
                changeUserSettings.changeUserDisplayName(newDisplayName: userName) { (success) in
                    if (success) {
                        print("README: User display name was changed")
                        self.removeAnimate()
                    } else {
                        print("README: Can't change user display name")
                        // inform user about an error
                    }
                }
            } else {
                print("REDAME: Try to change user display name but fields are empty1")
            }
        } else {
            print("REDAME: Try to change user display name but fields are empty2")
        }
    }
    
    @IBAction func removePopUp(_ sender: AnyObject) {
        removeAnimate()
    }

}
