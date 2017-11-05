//
//  CustomStackViewTest.swift
//  SocialMediaApp
//
//  Created by serwis on 05/11/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import SocialMediaApp

final class CustomStackViewTest: QuickSpec {

    override func spec() {
        
        describe("Custom Stack View") { 
            
            var stackView: CustomStackView!
            
            context("initialized with default init", closure: {
                
                beforeEach {
                    stackView = CustomStackView(frame: CGRect.zero)
                }
                
                it("should not be nil") {
                    expect(stackView).toNot(beNil())
                }
                
                it("should have set proper axis") {
                    
                    let stackViewAxis = stackView.axis
                    let expectedAxis = UILayoutConstraintAxis.horizontal
                    
                    expect(stackViewAxis).to(equal(expectedAxis))
                    
                }
                
                it("should have set proper distribution") {
                    
                    let stackViewDistribution = stackView.distribution
                    let expectedDistribution = UIStackViewDistribution.fillEqually
                    
                    expect(stackViewDistribution).to(equal(expectedDistribution))
                }
                
                it("should have auto layout enabled") {
                    expect(stackView.translatesAutoresizingMaskIntoConstraints).to(beFalse())
                }
            })
            
            context("initialized with coder", {
                
                it("should trigger fatal error if init with coder") {
                    expect { () -> Void in
                        let _ = CustomStackView(coder: NSCoder())
                        }.to(throwAssertion())
                }
            })
        }
    }
}
