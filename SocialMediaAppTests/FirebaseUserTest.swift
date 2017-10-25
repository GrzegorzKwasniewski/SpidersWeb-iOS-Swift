//
//  FirebaseUserTest.swift
//  SocialMediaApp
//
//  Created by serwis on 25/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import SocialMediaApp

class FirebaseUserTest: QuickSpec {

    override func spec() {
        
        describe("Firebase User Model") {
            
            var fireBaseUser: FirebaseUser!
            
            beforeEach {
                
            }
            
            context("when default initializer is used") {
                
                fireBaseUser = FirebaseUser()
                
                it("should set all properties to default value") {
                    expect(fireBaseUser.uid).to(equal("no data"))
                    expect(fireBaseUser.displayName).to(equal("no data"))
                    expect(fireBaseUser.email).to(equal("no data"))
                    expect(fireBaseUser.image).to(equal(#imageLiteral(resourceName: "default-avatar")))
                }
            }
        }
    }
}
