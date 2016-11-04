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
import GoogleSignIn
import SwiftKeychainWrapper
import TwitterKit

class SignInVC: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate, CompleteSignInWthFirebaseDelegate {
        
    @IBOutlet var emailField: RoundedBorderTextField!
    @IBOutlet var passwordField: RoundedBorderTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseLogin.sharedInstance.delegate = self
        EmailLogin.sharedInstance.delegate = self
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.stringForKey(KEY_UID) {
            print("SEGUE: Perform from viewDidAppear")
            performSegue(withIdentifier: "goToFeedVC", sender: nil)
        }
    }
    
    @IBAction func twitterSignInButton(_ sender: AnyObject) {
        TwitterLogin.sharedInstance.signInWithTwitter()
    }
    
    @IBAction func googleSignInButton(_ sender: AnyObject) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    // password need to have at least six characters
    // check for internet connection first
    @IBAction func signInAction(_ sender: AnyObject) {
        EmailLogin.sharedInstance.signInWithEmail(emailField: emailField, passwordField: passwordField)
    }
    
    @IBAction func facebookButtonAction(_ sender: AnyObject) {
        FacebookLogin.sharedInstance.signInWithFacebook()
    }
    
    // [START headless_google_auth]
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            print("README: Error when sign in with Google")
            return
        }
        
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!,
                                                          accessToken: (authentication?.accessToken)!)
        FirebaseLogin.sharedInstance.firebaseAuthentication(credential)
    }
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
        let keychainResult = KeychainWrapper.setString(id, forKey: KEY_UID)
        print("KEYCHAIN: Data was saved to Keychain - \(keychainResult)")
        print("SEGUE: Perform")
        performSegue(withIdentifier: "goToFeedVC", sender: nil)
    }

}

