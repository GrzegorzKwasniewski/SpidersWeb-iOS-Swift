//
//  MainVCInitializersTests.swift
//  SocialMediaApp
//
//  Created by serwis on 12.11.2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//


import Foundation
import Quick
import Nimble

import Firebase
import GoogleSignIn

@testable import SocialMediaApp

class MainVCInitializersTest: QuickSpec {
    
    override func spec() {
        
        var mainVC: MainVC!
        
        describe("Main View Controller") {
            
            beforeEach {
                mainVC = MainVC()
                _ = mainVC.view
            }
            
            context("created with default init", closure: {
                
                it("should not be nil") {
                    expect(mainVC).toNot(beNil())
                }
                
                it("should conform to ArrangeSubViews protocol") {
                    expect(mainVC).to(beAKindOf(ArrangeSubViews.self))
                }
                
                it("should have default dependencies set") {
                    expect(mainVC.firebaseLogin).to(beAnInstanceOf(FirebaseLogin.self))
                    expect(mainVC.twitterLogin).to(beAnInstanceOf(TwitterLogin.self))
                    expect(mainVC.facebookLogin).to(beAnInstanceOf(FacebookLogin.self))
                }
                
                it("should have set delegate for Firebase login") {
                    expect(mainVC.firebaseLogin.delegate).to(beAnInstanceOf(MainVC.self))
                }
                
                it("should have proper delegates for GIDSignIn set") {
                    expect(GIDSignIn.sharedInstance().delegate).to(beAnInstanceOf(MainVC.self))
                    expect(GIDSignIn.sharedInstance().uiDelegate).to(beAnInstanceOf(MainVC.self))
                }
            })
            
            context("initialized with coder", {
                
                it("should trigger fatal error if init with coder") {
                    expect { () -> Void in
                        let _ = MainVC(coder: NSCoder())
                        }.to(throwAssertion())
                }
            })
        }
    }
}

