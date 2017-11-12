//
//  MainVCGoogleButtonTest.swift
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

class MainVCGoogleButtonTest: QuickSpec {
    
    override func spec() {
        
        var mainVC: MainVC!
        
        describe("Main View Controller") {
            
            beforeEach {
                mainVC = MainVC()
                _ = mainVC.view
            }
        
            context("google button was created", closure: {
                
                it("should not be nil") {
                    expect(mainVC.googleButton).toNot(beNil())
                }
                
                it("view controller view should have google button as subview") {
                    
                    let mainVCView = mainVC.view
                    let googleButtonSuperView = mainVC.googleButton.superview
                    
                    expect(mainVCView).to(equal(googleButtonSuperView))
                    
                }
                
                it("should have constraints set") {
                    
                    let googleButton = mainVC.googleButton
                    let centerXView = mainVC.centerXView
                    let centerYView = mainVC.centerYView
                    let mainViewConstraints = mainVC.view.constraints
                    let googleButtonConstraints = mainVC.googleButton.constraints
                    
                    let heightConstraint = googleButtonConstraints.filter {
                        return $0.constant == 100 &&
                            $0.firstAnchor == googleButton.heightAnchor
                    }
                    
                    let widthConstraint = googleButtonConstraints.filter {
                        return $0.constant == 100 &&
                            $0.firstAnchor == googleButton.widthAnchor
                    }
                    
                    let trailingConstraint = mainViewConstraints.filter {
                        return $0.constant == -10 &&
                            $0.firstAnchor == googleButton.trailingAnchor &&
                            $0.secondAnchor == centerXView.leadingAnchor
                    }
                    
                    let topConstraint = mainViewConstraints.filter {
                        return $0.constant == 20 &&
                            $0.firstAnchor == googleButton.topAnchor &&
                            $0.secondAnchor == centerYView.bottomAnchor
                    }
                    
                    expect(heightConstraint.count).to(beGreaterThan(0))
                    expect(widthConstraint.count).to(beGreaterThan(0))
                    expect(trailingConstraint.count).to(beGreaterThan(0))
                    expect(topConstraint.count).to(beGreaterThan(0))
                    
                }
            })
        }
    }
}

