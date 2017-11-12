//
//  MainVCEmailButtonTest.swift
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

class MainVCEmailButtonTest: QuickSpec {
    
    override func spec() {
        
        var mainVC: MainVC!
        
        describe("Main View Controller") {
            
            beforeEach {
                mainVC = MainVC()
                _ = mainVC.view
            }
            
            context("emial button was created", closure: {
                
                it("should not be nil") {
                    expect(mainVC.emailButton).toNot(beNil())
                }
                
                it("view controller view should have email button as subview") {
                    
                    let mainVCView = mainVC.view
                    let emailButtonSuperView = mainVC.emailButton.superview
                    
                    expect(mainVCView).to(equal(emailButtonSuperView))
                    
                }
                
                it("should have proper action set") {
                    
                    let expectedAction = "signinWithEmail"
                    
                    let actions = mainVC.emailButton.actions(forTarget: mainVC, forControlEvent: .touchUpInside)
                    
                    let buttonAction = actions?.first!
                    
                    expect(buttonAction).to(equal(expectedAction))
                }
                
                it("should have constraints set") {
                    
                    let emailButton = mainVC.emailButton
                    let centerXView = mainVC.centerXView
                    let centerYView = mainVC.centerYView
                    let mainViewConstraints = mainVC.view.constraints
                    let emailButtonConstraints = mainVC.emailButton.constraints
                    
                    let heightConstraint = emailButtonConstraints.filter {
                        return $0.constant == 100 &&
                            $0.firstAnchor == emailButton.heightAnchor
                    }
                    
                    let widthConstraint = emailButtonConstraints.filter {
                        return $0.constant == 100 &&
                            $0.firstAnchor == emailButton.widthAnchor
                    }
                    
                    let trailingConstraint = mainViewConstraints.filter {
                        return $0.constant == -10 &&
                            $0.firstAnchor == emailButton.trailingAnchor &&
                            $0.secondAnchor == centerXView.leadingAnchor
                    }
                    
                    let bottomConstraint = mainViewConstraints.filter {
                        return $0.constant == 10 &&
                            $0.firstAnchor == emailButton.bottomAnchor &&
                            $0.secondAnchor == centerYView.topAnchor
                    }
                    
                    expect(heightConstraint.count).to(beGreaterThan(0))
                    expect(widthConstraint.count).to(beGreaterThan(0))
                    expect(trailingConstraint.count).to(beGreaterThan(0))
                    expect(bottomConstraint.count).to(beGreaterThan(0))
                    
                }
            })
            
            context("email button was tapped", closure: {
                
                it("should present SignInWithEmailVC") {
                    
                    mainVC.emailButton.sendActions(for: .touchUpInside)
                    
                //expect(mainVC.presentedViewController).toEventually(beAnInstanceOf(MainVC.self))
                }
            })
        }
    }
}

