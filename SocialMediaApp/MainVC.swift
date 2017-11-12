//
//  MainVC.swift
//  SocialMediaApp
//
//  Created by serwis on 29/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import GoogleSignIn
import SwiftKeychainWrapper

protocol ArrangeSubViews {
    func addAllSubViews()
    func setupMessageLabel()
}

protocol ButtonsActions {
    func signinWithEmail()
    func signinWithTwitter()
}

class MainVC: BaseVC {
    
    // test fore Core Data
    var managedObjectContext: NSManagedObjectContext!
    
    var firebaseLogin: FirebaseLogin
    var twitterLogin: TwitterLogin
    var facebookLogin: FacebookLogin
    
    // MARK: Properties
    
    let emailButton: RoundedButton = {
        let button = RoundedButton(withImage: #imageLiteral(resourceName: "email"))
        return button
    }()
    
    let twitterButton: RoundedButton = {
        let button = RoundedButton(withImage: #imageLiteral(resourceName: "twitter_icon"))
        return button
    }()
    
    let googleButton: RoundedButton = {
        let button = RoundedButton(withImage: #imageLiteral(resourceName: "google_icon"))
        return button
    }()
    
    let facebookButton: RoundedButton = {
        let button = RoundedButton(withImage: #imageLiteral(resourceName: "facebook_icon"))
        return button
    }()
    
    let messageLabel: CustomTextLabel = {
        let label = CustomTextLabel(withMessage: "Log In", textColor: Colors.GREY_TEXT_COLOR)
        return label
    }()
    
    let centerXView: RoundedView = {
        let view = RoundedView(frame: CGRect.zero)
        return view
    }()
    
    let centerYView: RoundedView = {
        let view = RoundedView(frame: CGRect.zero)
        return view
    }()
    
    // MARK: Initializers
    
    /**
     Initializer with dependencies injection
     */
    
    init(firebaseLogin: FirebaseLogin, twitterLogin: TwitterLogin, facebookLogin: FacebookLogin) {
        self.firebaseLogin = firebaseLogin
        self.twitterLogin = twitterLogin
        self.facebookLogin = facebookLogin
        
        super.init(nibName: nil, bundle: nil)
    }
    
    /**
     Initializer with default dependencies
     */
    
    init() {
        self.firebaseLogin = FirebaseLogin.sharedInstance
        self.twitterLogin = TwitterLogin.sharedInstance
        self.facebookLogin = FacebookLogin.sharedInstance
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View State

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegates()

        addAllSubViews()
        setupMessageLabel()
        setupCenterXView()
        setupCenterYView()
        setupEmailButton()
        setupTwitterButton()
        setupGoogleButton()
        setupFacebookButton()
        
        addButtonsTargets()

    }
    
    /**
     Set delegates for all services
     */
    
    func setDelegates() {
        
        firebaseLogin.delegate = self
        
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    /**
     Assign targets for all buttons added to view controller
     */
    
    func addButtonsTargets() {
        emailButton.addTarget(self, action: #selector(signinWithEmail), for: .touchUpInside)
        twitterButton.addTarget(self, action: #selector(signinWithTwitter), for: .touchUpInside)
    }
}

extension MainVC: ButtonsActions {
    
    /**
     Target function for emailButton. Use to show view controller for email login
     */
    
    func signinWithEmail() {
        let mainVCC = MainVC()
        self.present(mainVCC, animated: true)
    }
    
    /**
     Target function for twitterButton. Use to show view controller for twitter login
     */
    
    func signinWithTwitter() {
        twitterLogin.signInWithTwitter()
    }
}

// MARK: Firebase login Delegate

extension MainVC: CompleteSignInWithFirebaseDelegate {
    
    func completeSignIn(userID id: String, userData data: [String: String]) {
        FirebaseDataService.ds.createFirebaseDBUser(uid: id, userData: data)
        _ = KeychainWrapper.setString(id, forKey: KEY_UID)
        
        // pokaż kolekcję Spiderów
        
    }
}

// MARK: Google SignIn Delegate

extension MainVC: GIDSignInDelegate, GIDSignInUIDelegate {
    
    /**
     Callback method invoked after successful authtentication with Google credentials. This is method required form Google sign in framework
     */
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        
        if let googleError = error {
            print("README: Error when sign in with Google \(googleError)")
            return
        }
        
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!, accessToken: (authentication?.accessToken)!)
        
        firebaseLogin.firebaseAuthentication(credential)
    }
}
