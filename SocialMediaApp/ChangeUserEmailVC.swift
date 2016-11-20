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
