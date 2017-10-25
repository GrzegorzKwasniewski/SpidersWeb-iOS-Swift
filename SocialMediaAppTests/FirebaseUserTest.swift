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
            
            context("when default initializer is used") {
                
                it("should set all properties to default value") {
                    
                    fireBaseUser = FirebaseUser()

                    expect(fireBaseUser.uid).to(equal("no data"))
                    expect(fireBaseUser.displayName).to(equal("no data"))
                    expect(fireBaseUser.email).to(equal("no data"))
                    expect(fireBaseUser.image).to(equal(#imageLiteral(resourceName: "default-avatar")))
                }
            }
            
            context("when valid data is passed") {
                
                it("should set correctly all properties") {
                    
                    let userUID = UUID().uuidString
                    let displayName = "Marek"
                    let email = "marek@gmail.com"
                    let image = #imageLiteral(resourceName: "purple-cartoon-spider")
                    
                    fireBaseUser = FirebaseUser(userUid: userUID, userDisplayName: displayName, userEmail: email, userImage: image)
                    
                    expect(fireBaseUser.uid).to(equal(userUID))
                    expect(fireBaseUser.displayName).to(equal(displayName))
                    expect(fireBaseUser.email).to(equal(email))
                    expect(fireBaseUser.image).to(equal(image))
                }
            }
        }
    }
}
