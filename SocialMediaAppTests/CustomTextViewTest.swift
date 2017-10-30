//
//  CustomTextViewTest.swift
//  SocialMediaApp
//
//  Created by serwis on 29/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import SocialMediaApp

class CustomTextLabelText: QuickSpec {

    override func spec() {
        
        describe("Custom Text Label") {
            
            var customLabel: CustomTextLabel!
            
            context("initilized with default init", closure: {
                
                beforeEach {
                    customLabel = CustomTextLabel()
                }
                
                it("should be not nil") {
                    expect(customLabel).toNot(beNil())
                }
                
                it("should have proper background color") {
                    expect(customLabel.backgroundColor).to(equal(UIColor.clear))
                }
                
                it("should have proper number of lines") {
                    expect(customLabel.numberOfLines).to(equal(2))
                }
                
                it("should set text in center") {
                    expect(customLabel.textAlignment).to(equal(NSTextAlignment.center))
                }
                
                it("should allow to resize down text") {
                    expect(customLabel.adjustsFontSizeToFitWidth).to(equal(true))
                    expect(customLabel.minimumScaleFactor).to(equal(0.5))
                }
                
                it("should set proper font") {
                    let font = UIFont(name: Fonts.avenirHeavy, size: 28.0)
                    
                    expect(customLabel.font).to(equal(font))
                }
                
                it("should have enabled auto layout") {
                    expect(customLabel.translatesAutoresizingMaskIntoConstraints).to(equal(false))
                }
                
                it("should trigger fatal error if init with coder") {
                    expect { () -> Void in
                        let _ = CustomTextLabel(coder: NSCoder())
                        }.to(throwAssertion())
                }
            })
            
            context("initialized with custom init", closure: {
                
                beforeEach {
                    customLabel = CustomTextLabel(withMessage: "testValue", textColor: Colors.GREY_TEXT_COLOR)
                }
                
                it("should call default init") {
                    expect(customLabel.backgroundColor).to(equal(UIColor.clear))
                }
                
                it("should have proper text set") {
                    expect(customLabel.text).to(equal("testValue"))
                }
                
                it("should have proper text color") {
                    expect(customLabel.textColor).to(equal(Colors.GREY_TEXT_COLOR))
                }
            })
        }
    }
}
