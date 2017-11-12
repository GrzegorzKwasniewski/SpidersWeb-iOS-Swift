//
//  MainVCViewsTest.swift
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

class MainVCViewsTest: QuickSpec {
    
    override func spec() {
        
        var mainVC: MainVC!
        
        describe("Main View Controller") {
            
            beforeEach {
                mainVC = MainVC()
                _ = mainVC.view
            }
            
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
        }
    }
}

