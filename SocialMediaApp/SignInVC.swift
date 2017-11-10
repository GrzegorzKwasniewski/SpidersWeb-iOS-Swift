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

class SignInVC: BaseVC {
    
    // MARK: View State
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseLogin.sharedInstance.delegate = self
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.stringForKey(KEY_UID) {
            performSegue(withIdentifier: "goToSpiderCollection", sender: nil)
        }
    }
    
    // MARK: IBActions
    
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

// MARK: GID Delegate

extension SignInVC: GIDSignInDelegate, GIDSignInUIDelegate {
    
    // [START headless_google_auth]
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let googleError = error {
            print("README: Error when sign in with Google \(googleError)")
            return
        }
        authProvider = .Google
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!, accessToken: (authentication?.accessToken)!)
        FirebaseLogin.sharedInstance.firebaseAuthentication(credential)
    }
}

// MARK: Firebase Delegate

extension SignInVC: CompleteSignInWithFirebaseDelegate {
    
    func completeSignIn(userID id: String, userData data: [String: String]) {
        FirebaseDataService.ds.createFirebaseDBUser(uid: id, userData: data)
        _ = KeychainWrapper.setString(id, forKey: KEY_UID)
        performSegue(withIdentifier: "goToSpiderCollection", sender: nil)
    }
}
