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
    
    // MARK: Class Properties
    
    @IBOutlet var emailField: RoundedBorderTextField!
    @IBOutlet var passwordField: RoundedBorderTextField!

    // MARK: View State
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegates()
        
    }
    
    // MARK: Actions
    
    @IBAction func signInWithEmail(_ sender: UIButton) {
        EmailLogin.sharedInstance.signInWithEmail(emailField: emailField, passwordField: passwordField)
    }
    
    @IBAction func backButtonForTests(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: Custom Functions
    
    func setDelegates() {
        EmailLogin.sharedInstance.delegate = self
        EmailLogin.sharedInstance.popUpDelegate = self
        passwordField.delegate = self
        emailField.delegate = self
    }
}

// MARK: Delegate For SignIn

extension SigInWithEmailVC: CompleteSignInWthFirebaseDelegate {
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        FirebaseDataService.ds.createFirebaseDBUser(uid: id, userData: userData)
        let keychainResult = KeychainWrapper.setString(id, forKey: KEY_UID)
        print("KEYCHAIN: Data was saved to Keychain - \(keychainResult)")
        print("SEGUE: Perform")
        performSegue(withIdentifier: "goToSpiderCollection", sender: nil)
    }
}

// MARK: Delegate For ShowPopUp

extension SigInWithEmailVC: ShowPopUp {
    
    func authenticationFailed(withMessage message: String = "") {
        view.addSubview(setupViewForAuthenticationFailed(
            withMessage: message,
            forVC: self
        ))
    }
}


// MARK: Delegate For UITextFieldDelegate

extension SigInWithEmailVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // only call if password text field was used
        if textField.tag == 1 {
            self.signInWithEmail(UIButton())
        }
        
        self.view.endEditing(true)
        return true
    }
}
