//
//  ViewController.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 05/09/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import SwiftKeychainWrapper

class SignInVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        FirebaseLogin.sharedInstance.delegate = self
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
    @IBAction func twitterSignInButton(_ sender: AnyObject) {
        TwitterLogin.sharedInstance.signInWithTwitter()
    }
    
    @IBAction func googleSignInButton(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func signInWithEmailButton(_ sender: AnyObject) {
        performSegue(withIdentifier: "signInWithEmail", sender: nil)
    }
    
    @IBAction func facebookButtonAction(_ sender: AnyObject) {
        FacebookLogin.sharedInstance.signInWithFacebook()
    }
}

extension SignInVC: GIDSignInDelegate, GIDSignInUIDelegate {
    
    // [START headless_google_auth]
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            print("README: Error when sign in with Google")
            return
        }
        authProvider = .Google
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!, accessToken: (authentication?.accessToken)!)
        FirebaseLogin.sharedInstance.firebaseAuthentication(credential)
    }
}

extension SignInVC: CompleteSignInWthFirebaseDelegate {
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
        let keychainResult = KeychainWrapper.setString(id, forKey: KEY_UID)
        print("KEYCHAIN: Data was saved to Keychain - \(keychainResult)")
        print("SEGUE: Perform")
        performSegue(withIdentifier: "goToSpiderCollection", sender: nil)
    }
}

