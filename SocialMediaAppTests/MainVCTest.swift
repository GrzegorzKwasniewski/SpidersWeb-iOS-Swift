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
            
            context("created with default init", closure: { 
                
                beforeEach {
                    mainVC = MainVC()
                }
                
                it("should not be nil") {
                    expect(mainVC).toNot(beNil())
                }
                
                it("should trigger fatal error if init with coder") {
                    expect { () -> Void in
                        let _ = MainVC(coder: NSCoder())
                        }.to(throwAssertion())
                }
            })
        }
    }
}
