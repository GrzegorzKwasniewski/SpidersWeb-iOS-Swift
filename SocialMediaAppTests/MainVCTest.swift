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
                
                it("should trigger fatal error if init with coder") {
                    expect { () -> Void in
                        let _ = MainVC(coder: NSCoder())
                    }.to(throwAssertion())
                }
            })
            
            context("Message label was set", closure: {
                
                it("view controller should have login message label") {
                    expect(mainVC.messageLabel).toNot(beNil())
                }
                
                it("view controller should have message label as subview") {
                    
                    let mainVCView = mainVC.view
                    let messageLabelSuperView = mainVC.messageLabel.superview
                    
                    expect(mainVCView).to(equal(messageLabelSuperView))
                    
                }
                
                it("should have constraints set") {
                    
                    //let messageLabel = mainVC.messageLabel
                    
                    //let constraints = messageLabel.constraintsAffectingLayout(for: .horizontal)
                    
                    
                }
            })
        }
    }
}
