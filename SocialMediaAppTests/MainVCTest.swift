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
                    
                    let centerXView = mainVC.centerXView
                    let mainView = mainVC.view
                    let mainViewConstraints = mainVC.view.constraints
                    
                    let topConstraint = mainViewConstraints.filter {
                        return $0.firstAnchor == centerXView.topAnchor &&
                            $0.secondAnchor == mainView?.topAnchor
                    }
                    
                    let bottomConstraint = mainViewConstraints.filter {
                        return $0.firstAnchor == centerXView.bottomAnchor &&
                            $0.secondAnchor == mainView?.bottomAnchor
                    }
                    
                    let centerXConstraint = mainViewConstraints.filter {
                        return $0.firstAnchor == centerXView.centerXAnchor &&
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
            
            context("twitter button was created", closure: {
                
                it("should not be nil") {
                    expect(mainVC.twitterButton).toNot(beNil())
                }
                
                it("view controller view should have twitter button as subview") {
                    
                    let mainVCView = mainVC.view
                    let twitterButtonSuperView = mainVC.twitterButton.superview
                    
                    expect(mainVCView).to(equal(twitterButtonSuperView))
                    
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
            
            context("facebook button was created", closure: {
                
                it("should not be nil") {
                    expect(mainVC.facebookButton).toNot(beNil())
                }
                
                it("view controller view should have twitter button as subview") {
                    
                    let mainVCView = mainVC.view
                    let facebookButtonSuperView = mainVC.facebookButton.superview
                    
                    expect(mainVCView).to(equal(facebookButtonSuperView))
                    
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
