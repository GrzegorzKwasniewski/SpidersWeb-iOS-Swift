//
//  AppDelegate.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 05/09/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKLoginKit
import TwitterKit
import Fabric
import UserNotifications
import CoreData

// MARK: Schema Dependent Variables

#if DEVELOPMENT
let SERVER_URL = "dev"
let API_TOKEN = ""
#else
let SERVER_URL = "production"
let API_TOKEN = ""
#endif

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: Fields

    var window: UIWindow?
    
    // lazy mean that stack won't be set up unitl the first itme You asccess it
    lazy var coreDataStack = CoreDataStack(modelName: "SpidersData")
    
    // MARK: Aplication State Functions

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // ignore storyboards
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        window?.rootViewController = MainVC()
        
        let mainVC = window?.rootViewController as! MainVC
        
        // whole Core Data stack will be init here - lazy property will be used
        mainVC.managedObjectContext = coreDataStack.managedContext
        
        setupUITabBar()
        setupLocalNotification()
        setupFirebase(withAplication: application, andLaunchOptions: launchOptions)
        
        return true
    }
    
    // we make sure that all data will be saved by Core Data when app will move to the background or will be terminated
    
    func applicationDidEnterBackground(
        _ application: UIApplication) {
        coreDataStack.saveContext()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        coreDataStack.saveContext()
    }
    
    /// Function for configuring properties for UITabBar
    
    func setupUITabBar() {
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().layer.borderColor = Colors.GREY_TEXT_COLOR.cgColor
        UITabBar.appearance().layer.borderWidth = 2
        UITabBar.appearance().tintColor = Colors.MAIN_COLOR_DARKER
        UITabBar.appearance().unselectedItemTintColor = Colors.GREY_TEXT_COLOR
    }
    
    /// Function for asking permission about local notifications
    
    func setupLocalNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound]) { (didAllow, error) in
            if didAllow {
                
            } else {
                
            }
        }
    }
    
    /// Function for configuring Firebase
    
    func setupFirebase(withAplication application: UIApplication, andLaunchOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        FIRApp.configure()
        FIRDatabase.database().persistenceEnabled = true
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        Fabric.with([Twitter.self])
        
        let key = Bundle.main.object(forInfoDictionaryKey: "consumerKey"),
        secret = Bundle.main.object(forInfoDictionaryKey: "consumerSecret")
        if let key = key as? String, let secret = secret as? String
            , !key.isEmpty && !secret.isEmpty {
            Twitter.sharedInstance().start(withConsumerKey: key, consumerSecret: secret)
        }
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any])
        -> Bool {
            
            if Twitter.sharedInstance().application(application, open:url, options: options) {
                return true
            }
            
            return self.application(
                application,
                open: url,
                sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String?,
                annotation: [:])
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        if GIDSignIn.sharedInstance().handle(
            url,
            sourceApplication: sourceApplication,
            annotation: annotation) {
            
            return true
        }
        
        return FBSDKApplicationDelegate.sharedInstance().application( application,
            open: url,
            sourceApplication: sourceApplication,
            annotation: annotation)
    }
}

