//
//  RoundedButtonTest.swift
//  SocialMediaApp
//
//  Created by serwis on 31/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import SocialMediaApp

final class RoundedButtonTest: QuickSpec {

    override func spec() {
        
        describe("Rounded Button") {
            
            var roundedButton: RoundedButton!
            
            context("initialized with default init", {
                
                beforeEach {
                    roundedButton = RoundedButton(frame: CGRect.zero)
                }
                
                it("should not be nil") {
                    expect(roundedButton).toNot(beNil())
                }
                
                it("should have proper background color set") {
                    
                    let expectedBackgroundColor = Colors.MAIN_COLOR.cgColor
                    
                    expect(roundedButton.layer.backgroundColor).to(equal(expectedBackgroundColor))
                    
                }
                
                it("should trigger fatal error if init with coder") {
                    expect { () -> Void in
                        let _ = RoundedButton(coder: NSCoder())
                        }.to(throwAssertion())
                }
            })
        }
    }
}
