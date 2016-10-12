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

class SignInVC: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
        
    @IBOutlet var emailField: RoundedBorderTextField!
    @IBOutlet var passwordField: RoundedBorderTextField!
    
    
    @IBAction func twitterSignInButton(_ sender: AnyObject) {
        Twitter.sharedInstance().logIn() { (session, error) in
            if let session = session {
                // [START headless_twitter_auth]
                let credential = FIRTwitterAuthProvider.credential(withToken: session.authToken, secret: session.authTokenSecret)
                // [END headless_twitter_auth]
                self.firebaseAuth(credential)
            } else {
                print("README: Error while authenticating with Twitter")
            }
        }
    }
    
    @IBAction func googleSignInButton(_ sender: AnyObject) {
        GIDSignIn.sharedInstance().signIn()
    }
    // password need to have at least six characters
    // check for internet connection first
    @IBAction func signInAction(_ sender: AnyObject) {
        if let email = emailField.text, let password = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("README: Email user authenticated with Firebase")
                    if let firebaseUser = user {
                        let userData = ["provider": firebaseUser.providerID]
                        self.completeSignIn(id: firebaseUser.uid, userData: userData)
                    }
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("README: Unable to authenticate with Firebasr using email")
                        } else {
                            print("README: Created user with new email")
                            if let firebaseUser = user {
                                let userData = ["provider": firebaseUser.providerID]
                                self.completeSignIn(id: firebaseUser.uid, userData: userData)
                            }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("README: Unable to authenticate with Firebase. ERROR: \(error)")
            } else {
                print("README: Succesfuly authenticeted with Firebase")
                // store user UID using Keychains
                if let firebaseUser = user {
                    let userData = ["provider": credential.provider]
                    self.completeSignIn(id: firebaseUser.uid, userData: userData)
                }
            }
        })
    }
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
        let keychainResult = KeychainWrapper.setString(id, forKey: KEY_UID)
        print("KEYCHAIN: Data was saved to Keychain - \(keychainResult)")
        print("SEGUE: Perform")
        performSegue(withIdentifier: "goToFeedVC", sender: nil)
    }

}

