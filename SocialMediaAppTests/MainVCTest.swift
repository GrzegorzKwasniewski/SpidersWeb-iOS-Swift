//
//  MainVCTest.swift
//  SocialMediaApp
//
//  Created by serwis on 29/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import SocialMediaApp

class MainVCTest: QuickSpec {

    override func spec() {
        
        var mainVC: MainVC!
        
        describe("Main View Controller") {
            
            beforeEach {
                mainVC = MainVC()
            }
            
            context("created with default init", closure: {
            
                it("should not be nil") {
                    expect(mainVC).toNot(beNil())
                }
                
                it("should conform to ArrangeSubViews protocol") {
                    expect(mainVC).to(beAKindOf(ArrangeSubViews.self))
                }
            })
            
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
            
            context("center X view was created", closure: {
                
                it("should not be nil") {
                    expect(mainVC.centerXView).toNot(beNil())
                }
                
                it("view controller view should have center view as subview") {
                    
                    let mainVCView = mainVC.view
                    let centerViewSuperView = mainVC.centerXView.superview
                    
                    expect(mainVCView).to(equal(centerViewSuperView))
                    
                }
                
                it("should have constraints set") {
                    
                    let centerView = mainVC.centerXView
                    let mainView = mainVC.view
                    let mainViewConstraints = mainVC.view.constraints
                    
                    let topConstraint = mainViewConstraints.filter {
                        return $0.firstAnchor == centerView.topAnchor &&
                            $0.secondAnchor == mainView?.topAnchor
                    }
                    
                    let bottomConstraint = mainViewConstraints.filter {
                        return $0.firstAnchor == centerView.bottomAnchor &&
                            $0.secondAnchor == mainView?.bottomAnchor
                    }
                    
                    let centerXConstraint = mainViewConstraints.filter {
                        return $0.firstAnchor == centerView.centerXAnchor &&
                            $0.secondAnchor == mainView?.centerXAnchor
                    }
                    
                    expect(topConstraint.count).to(beGreaterThan(0))
                    expect(bottomConstraint.count).to(beGreaterThan(0))
                    expect(centerXConstraint.count).to(beGreaterThan(0))
                    
                }
            })
            
            context("center Y view was created", closure: {
                
                it("should not be nil") {
                    expect(mainVC.centerYView).toNot(beNil())
                }
                
                it("view controller view should have center view as subview") {
                    
                    let mainVCView = mainVC.view
                    let centerViewSuperView = mainVC.centerYView.superview
                    
                    expect(mainVCView).to(equal(centerViewSuperView))
                    
                }
                
                it("should have constraints set") {
                    
                    let centerView = mainVC.centerYView
                    let mainView = mainVC.view
                    let mainViewConstraints = mainVC.view.constraints
                    
                    let leadingConstraint = mainViewConstraints.filter {
                        return $0.firstAnchor == centerView.leadingAnchor &&
                            $0.secondAnchor == mainView?.leadingAnchor
                    }
                    
                    let trailingConstraint = mainViewConstraints.filter {
                        return $0.firstAnchor == centerView.trailingAnchor &&
                            $0.secondAnchor == mainView?.trailingAnchor
                    }
                    
                    let centerYConstraint = mainViewConstraints.filter {
                        return $0.firstAnchor == centerView.centerYAnchor &&
                            $0.secondAnchor == mainView?.centerYAnchor
                    }
                    
                    expect(leadingConstraint.count).to(beGreaterThan(0))
                    expect(trailingConstraint.count).to(beGreaterThan(0))
                    expect(centerYConstraint.count).to(beGreaterThan(0))

                }
            })
            
            context("emial button was created", closure: { 
                
                it("should not be nil") {
                    expect(mainVC.emailButton).toNot(beNil())
                }
                
                it("view controller view should have email button as subview") {
                    
                    let mainVCView = mainVC.view
                    let emailButtonSuperView = mainVC.emailButton.superview
                    
                    expect(mainVCView).to(equal(emailButtonSuperView))
                    
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
                        return $0.constant == 10 &&
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
