//
//  RoundedViewTest.swift
//  SocialMediaApp
//
//  Created by serwis on 05/11/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import SocialMediaApp

final class RoundedViewTest: QuickSpec {

    override func spec() {
        
        describe("Rounded View") {
            
            var roundedView: RoundedView!
            
            beforeEach {
                roundedView = RoundedView(frame: CGRect.zero)
            }
            
            context("initialized with default init", closure: {
                
                it("should not be nil") {
                    expect(roundedView).toNot(beNil())
                }
                
                it("should have proper background color set") {
                    
                    let backgroundColor = roundedView.layer.backgroundColor
                    let expectedColor = Colors.MAIN_COLOR.cgColor
                    
                    expect(backgroundColor).to(equal(expectedColor))
                    
                }
                
                it("should have auto layout enabled") {
                    expect(roundedView.translatesAutoresizingMaskIntoConstraints).to(beFalse())
                }
                
                it("should have proper vaule for corner radius") {
                    roundedView.layoutSubviews()
                    expect(roundedView.layer.cornerRadius).to(equal(5))
                }
            })
            
            context("initialized with coder", {
                
                it("should trigger fatal error if init with coder") {
                    expect { () -> Void in
                        let _ = RoundedView(coder: NSCoder.empty())
                        }.to(throwAssertion())
                }
            })
        }
    }
}

extension NSCoder {
    class func empty() -> NSCoder {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.finishEncoding()
        return NSKeyedUnarchiver(forReadingWith: data as Data)
    }
}
