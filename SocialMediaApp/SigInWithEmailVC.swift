//
//  SigInWithEmailVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 04/01/17.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class SigInWithEmailVC: BaseVC {
    
    @IBOutlet var emailField: RoundedBorderTextField!
    @IBOutlet var passwordField: RoundedBorderTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        EmailLogin.sharedInstance.delegate = self
    }
    
    @IBAction func signInWithEmail(_ sender: AnyObject) {
        EmailLogin.sharedInstance.signInWithEmail(emailField: emailField, passwordField: passwordField)
    }
    
    @IBAction func backButtonForTests(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SigInWithEmailVC: CompleteSignInWthFirebaseDelegate {
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
        let keychainResult = KeychainWrapper.setString(id, forKey: KEY_UID)
        print("KEYCHAIN: Data was saved to Keychain - \(keychainResult)")
        print("SEGUE: Perform")
        performSegue(withIdentifier: "goToSpiderCollection", sender: nil)
    }
}
