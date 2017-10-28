//
//  SpiderCollectionVCTest.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 28/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import KIF
import Nimble

class SpidersCollectionVCTest: BaseUITests {

    override func beforeAll() {
        tapButton(buttonName: Name.emailLoginButton)
        expectToSeeSignInWithEmailVC()
    }
    
    override func afterAll() {
        tapButton(buttonName: Name.backButton)
        expectToHideSignInWithEmailVC()
        expectToSeeSignInVC()
    }
    
    override func beforeEach() {
        clearOutAllFields()
    }

}
