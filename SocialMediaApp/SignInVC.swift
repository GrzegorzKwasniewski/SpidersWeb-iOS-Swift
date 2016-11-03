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

class SignInVC: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate, FirebaseLoginDelegate {
        
    @IBOutlet var emailField: RoundedBorderTextField!
    @IBOutlet var passwordField: RoundedBorderTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseLogin.login.delegate = self
        EmailLogin.login.delegate = self
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
        TwitterLogin.login.loginWithTwitter()
    }
    
    @IBAction func googleSignInButton(_ sender: AnyObject) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("README: Unable to authenticate with Firebase. ERROR: \(error)")
            } else {
                print("README: Succesfuly authenticeted with Firebase")
                // store user UID using Keychains
                if let firebaseUser = user {
                    var firebaseUserName = ""
                    if let userName = firebaseUser.displayName {
                        firebaseUserName = userName
                    }
                    let userData: Dictionary<String, String> = [
                        "provider": credential.provider,
                        "userName": firebaseUserName,
                        "photoUrl": String(describing: firebaseUser.photoURL)
                    ]
                    self.completeSignIn(id: firebaseUser.uid, userData: userData)
                }
            }
        })
    }
    
    // password need to have at least six characters
    // check for internet connection first
    @IBAction func signInAction(_ sender: AnyObject) {
        EmailLogin.login.signInWithEmail(emailField: emailField, passwordField: passwordField)
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
    
    // [START headless_google_auth]
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            print("README: Error when sign in with Google")
            return
        }
        
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!,
                                                          accessToken: (authentication?.accessToken)!)
        firebaseAuth(credential)
    }
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
        let keychainResult = KeychainWrapper.setString(id, forKey: KEY_UID)
        print("KEYCHAIN: Data was saved to Keychain - \(keychainResult)")
        print("SEGUE: Perform")
        performSegue(withIdentifier: "goToFeedVC", sender: nil)
    }

}

