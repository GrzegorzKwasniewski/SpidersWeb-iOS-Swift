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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeUserName(_ sender: AnyObject) {
        
        // Validate user name
        
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            if let currentUser = user {
                let changeRequest = currentUser.profileChangeRequest()
                changeRequest.displayName = self.userName.text
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
