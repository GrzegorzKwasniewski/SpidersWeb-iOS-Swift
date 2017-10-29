//
//  SignInVCTest.swift
//  SocialMediaApp
//
//  Created by serwis on 25/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import SocialMediaApp

class SignInVCTest: QuickSpec {

    override func spec() {
        
        var signInVC: SignInVC!
        
        describe("SignInVC") {
            
            beforeEach {
                signInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInVC") as! SignInVC

                _ = signInVC.view
            }
            
            describe("did load") {
                
                it("should have NSCache assigned") {
                    expect(CacheStore.imageCache).notTo(beNil())
                }
            }
        }
    }
}
