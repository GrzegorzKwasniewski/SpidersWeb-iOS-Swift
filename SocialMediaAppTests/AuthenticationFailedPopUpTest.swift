//
//  FirstTest.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 16/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import SocialMediaApp

class AuthenticationFailedPopUpTest: QuickSpec {
    
    override func spec() {
        
        describe("AuthenticationFailedPopUp view") {
            
            context("After being properly initialized") {
                
                let popUp: AuthenticationFailedPopUp = AuthenticationFailedPopUp()
                
                it("Should have blur view added") {
                
                    expect(popUp.blurView).toNot(beNil())
                    
                }
                
                it("should have dissmis button added") {
                
                    let dismissButton = popUp.dismissButton

                    let expectedAccessibilityLabel = "dismissButton"
                    
                    expect(dismissButton.accessibilityLabel).to(equal(expectedAccessibilityLabel))
                    
                }
            }
        }
    }
}

