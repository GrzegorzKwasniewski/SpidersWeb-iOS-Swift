//
//  MainVCFacebookButtonTest.swift
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

class MainVCFacebookButtonTest: QuickSpec {
    
    override func spec() {
        
        var mainVC: MainVC!
        
        describe("Main View Controller") {
            
            beforeEach {
                mainVC = MainVC()
                _ = mainVC.view
            }
            
            context("facebook button was created", closure: {
                
                it("should not be nil") {
                    expect(mainVC.facebookButton).toNot(beNil())
                }
                
                it("view controller view should have twitter button as subview") {
                    
                    let mainVCView = mainVC.view
                    let facebookButtonSuperView = mainVC.facebookButton.superview
                    
                    expect(mainVCView).to(equal(facebookButtonSuperView))
                    
                }
                
                it("should have proper action set") {
                    
                    let expectedAction = "signinWithFacebook"
                    
                    let actions = mainVC.facebookButton.actions(forTarget: mainVC, forControlEvent: .touchUpInside)
                    
                    let buttonAction = actions?.first!
                    
                    expect(buttonAction).to(equal(expectedAction))
                }
                
                it("should have constraints set") {
                    
                    let facebookButton = mainVC.facebookButton
                    let centerXView = mainVC.centerXView
                    let centerYView = mainVC.centerYView
                    let mainViewConstraints = mainVC.view.constraints
                    let facebookButtonConstraints = mainVC.facebookButton.constraints
                    
                    let heightConstraint = facebookButtonConstraints.filter {
                        return $0.constant == 100 &&
                            $0.firstAnchor == facebookButton.heightAnchor
                    }
                    
                    let widthConstraint = facebookButtonConstraints.filter {
                        return $0.constant == 100 &&
                            $0.firstAnchor == facebookButton.widthAnchor
                    }
                    
                    let leadingConstraint = mainViewConstraints.filter {
                        return $0.constant == 10 &&
                            $0.firstAnchor == facebookButton.leadingAnchor &&
                            $0.secondAnchor == centerXView.trailingAnchor
                    }
                    
                    let topConstraint = mainViewConstraints.filter {
                        return $0.constant == 20 &&
                            $0.firstAnchor == facebookButton.topAnchor &&
                            $0.secondAnchor == centerYView.bottomAnchor
                    }
                    
                    expect(heightConstraint.count).to(beGreaterThan(0))
                    expect(widthConstraint.count).to(beGreaterThan(0))
                    expect(leadingConstraint.count).to(beGreaterThan(0))
                    expect(topConstraint.count).to(beGreaterThan(0))
                    
                }
            })
        }
    }
}

