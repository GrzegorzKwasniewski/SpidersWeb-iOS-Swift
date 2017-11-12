//
//  MainVCLabelsTest.swift
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

class MainVCLabelsTest: QuickSpec {
    
    override func spec() {
        
        var mainVC: MainVC!
        
        describe("Main View Controller") {
            
            beforeEach {
                mainVC = MainVC()
                _ = mainVC.view
            }
            
            context("message label was created", closure: {
                
                it("and should not be nil") {
                    expect(mainVC.messageLabel).toNot(beNil())
                }
                
                it("view controller view should have message label as subview") {
                    
                    let mainVCView = mainVC.view
                    let messageLabelSuperView = mainVC.messageLabel.superview
                    
                    expect(mainVCView).to(equal(messageLabelSuperView))
                    
                }
                
                it("should have constraints set") {
                    
                    let messageLabel = mainVC.messageLabel
                    let mainView = mainVC.view
                    let constraints = mainVC.view.constraints
                    
                    let topConstraint = constraints.filter {
                        return $0.constant == 40 &&
                            $0.firstAnchor == messageLabel.topAnchor &&
                            $0.secondAnchor == mainView?.topAnchor
                    }
                    
                    let leadingConstraint = constraints.filter {
                        return $0.constant == 20 &&
                            $0.firstAnchor == messageLabel.leadingAnchor &&
                            $0.secondAnchor == mainView?.leadingAnchor
                    }
                    
                    let trailingConstraint = constraints.filter {
                        return $0.constant == -20 &&
                            $0.firstAnchor == messageLabel.trailingAnchor &&
                            $0.secondAnchor == mainView?.trailingAnchor
                    }
                    
                    // We need to set additional requirements about multiplier because when we set it to 0.2 it will be somethnig around this value (eg. 0.2000040)
                    
                    let heightConstraint = constraints.filter {
                        return $0.multiplier >= 0.2 &&
                            $0.multiplier <= 0.21 &&
                            $0.firstAnchor == messageLabel.heightAnchor &&
                            $0.secondAnchor == mainView?.heightAnchor
                    }
                    
                    let centerXConstraint = constraints.filter {
                        return $0.firstAnchor == messageLabel.centerXAnchor &&
                            $0.secondAnchor == mainView?.centerXAnchor
                    }
                    
                    expect(topConstraint.count).to(beGreaterThan(0))
                    expect(leadingConstraint.count).to(beGreaterThan(0))
                    expect(trailingConstraint.count).to(beGreaterThan(0))
                    expect(heightConstraint.count).to(beGreaterThan(0))
                    expect(centerXConstraint.count).to(beGreaterThan(0))
                    
                }
            })
        }
    }
}

