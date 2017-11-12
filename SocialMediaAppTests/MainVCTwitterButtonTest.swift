//
//  MainVCTwitterButtonTest.swift
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

class MainVCTwitterButtonTest: QuickSpec {
    
    override func spec() {
        
        var mainVC: MainVC!
        
        describe("Main View Controller") {
            
            beforeEach {
                mainVC = MainVC()
                _ = mainVC.view
            }
            
            context("twitter button was created", closure: {
                
                it("should not be nil") {
                    expect(mainVC.twitterButton).toNot(beNil())
                }
                
                it("view controller view should have twitter button as subview") {
                    
                    let mainVCView = mainVC.view
                    let twitterButtonSuperView = mainVC.twitterButton.superview
                    
                    expect(mainVCView).to(equal(twitterButtonSuperView))
                    
                }
                
                it("should have proper action set") {
                    
                    let expectedAction = "signinWithTwitter"
                    
                    let actions = mainVC.twitterButton.actions(forTarget: mainVC, forControlEvent: .touchUpInside)
                    
                    let buttonAction = actions?.first!
                    
                    expect(buttonAction).to(equal(expectedAction))
                }
                
                it("should have constraints set") {
                    
                    let twitterButton = mainVC.twitterButton
                    let centerXView = mainVC.centerXView
                    let centerYView = mainVC.centerYView
                    let mainViewConstraints = mainVC.view.constraints
                    let twitterButtonConstraints = mainVC.twitterButton.constraints
                    
                    let heightConstraint = twitterButtonConstraints.filter {
                        return $0.constant == 100 &&
                            $0.firstAnchor == twitterButton.heightAnchor
                    }
                    
                    let widthConstraint = twitterButtonConstraints.filter {
                        return $0.constant == 100 &&
                            $0.firstAnchor == twitterButton.widthAnchor
                    }
                    
                    let leadingConstraint = mainViewConstraints.filter {
                        return $0.constant == 10 &&
                            $0.firstAnchor == twitterButton.leadingAnchor &&
                            $0.secondAnchor == centerXView.trailingAnchor
                    }
                    
                    let bottomConstraint = mainViewConstraints.filter {
                        return $0.constant == 10 &&
                            $0.firstAnchor == twitterButton.bottomAnchor &&
                            $0.secondAnchor == centerYView.topAnchor
                    }
                    
                    expect(heightConstraint.count).to(beGreaterThan(0))
                    expect(widthConstraint.count).to(beGreaterThan(0))
                    expect(leadingConstraint.count).to(beGreaterThan(0))
                    expect(bottomConstraint.count).to(beGreaterThan(0))
                    
                }
            })
        }
    }
}

