//
//  ViewController.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 05/09/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet var emailField: NoBorderTextField!
    
    @IBOutlet var passwordField: NoBorderTextField!
    
    // password need to have at least six characters
    // check for internet connection first
    @IBAction func signInAction(_ sender: AnyObject) {
        if let email = emailField.text, let password = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("README: Email user authenticated with Firebase")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("README: Unable to authenticate with Firebasr using email")
                        } else {
                            print("README: Created user with new email")
                        }
                    })
                }
            })
        }
    }

    @IBAction func facebookButtonAction(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            
            if error != nil {
                print("README: Can't get data form Facebook. Return ERROR: \(error)")
            } else if result?.isCancelled == true { // if user deny permissions
                print("README: User cancelled user authentication")
            } else {
                print("README: Successfuly authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("README: Unable to authenticate with Firebase. ERROR: \(error)")
            } else {
                print("README: Succesfuly authenticeted with Firebase")
            }
        })
    }


}

