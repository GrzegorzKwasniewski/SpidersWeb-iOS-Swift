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
                
                it("should have proper insets for image view") {
                    
                    let imageInsets = roundedButton.imageEdgeInsets
                    
                    expect(imageInsets.top).to(equal(15))
                    expect(imageInsets.bottom).to(equal(15))
                    expect(imageInsets.left).to(equal(15))
                    expect(imageInsets.right).to(equal(15))
                    
                }
                
                it("should have auto-layout enable") {
                    expect(roundedButton.translatesAutoresizingMaskIntoConstraints).to(beFalse())
                }
                
                it("should have proper value for tint color") {
                    expect(roundedButton.tintColor).to(equal(UIColor.white))
                }
                
                it("should have proper vaule for corner radius") {
                    roundedButton.layoutSubviews()
                    expect(roundedButton.layer.cornerRadius).to(equal(5))
                }
            })
            
            context("initialized with custom init(withTitle: titleColor:)", { 
                
                beforeEach {
                    roundedButton = RoundedButton(withTitle: "testTitle")
                }
                
                it("should have proper title set for state .normal") {
                    
                    let normalStateTitle = roundedButton.attributedTitle(for: .normal)?.string
                    
                    expect(normalStateTitle).to(equal("testTitle"))
                }
                
                it("should have proper font for title") {
                    
                    let attributedTitle = roundedButton.attributedTitle(for: .normal)
                    let titleFont = attributedTitle?.attribute(NSFontAttributeName, at: 0, effectiveRange: nil) as? UIFont
                    
                    expect(titleFont).toNot(beNil())
                    
                    // It seems that we can compare two UIFont objects because UIFont object is copied (NSCopy)
                    
                    let expectedFont = UIFont(name: Fonts.avenirHeavy, size: 18)
                    
                    expect(titleFont).to(equal(expectedFont))
                    
                }
                
                it("should have proper title color") {
                    
                    let currentTitleColor = roundedButton.titleColor(for: .normal)
                    let expectedColor = Colors.GREY_TEXT_COLOR
                    
                    expect(currentTitleColor).to(equal(expectedColor))
                    
                }
            })
            
            context("initialized with custom init(withImage:)", { 
                
                beforeEach {
                    roundedButton = RoundedButton(withImage: #imageLiteral(resourceName: "purple-cartoon-spider"))
                }
                
                it("should have proper image set") {
                    
                    let buttonImage = roundedButton.image(for: .normal)
                    let expectedImage = #imageLiteral(resourceName: "purple-cartoon-spider")
                    
                    expect(buttonImage).to(equal(expectedImage))
                    
                }
            })
            
            context("user interacted with button", { 
                
                beforeEach {
                    roundedButton = RoundedButton(frame: CGRect.zero)
                }
                
                it("should have added resize animation") {
                    
                    _ = roundedButton.beginTracking(UITouch(), with: UIEvent())
                    
                    let animation = roundedButton.layer.animation(forKey: "resizeButtonAnimation")
                    
                    expect(animation).toNot(beNil())
                }
            })
            
            context("initialized with coder", { 
                
                it("should trigger fatal error if init with coder") {
                    expect { () -> Void in
                        let _ = RoundedButton(coder: NSCoder())
                    }.to(throwAssertion())
                }
            })
        }
    }
}
