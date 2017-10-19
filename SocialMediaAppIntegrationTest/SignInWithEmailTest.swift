//
//  SignInWithEmailTest.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 19/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import KIF
import Nimble

class SignInWithEmailTest : BaseUITests {
    
    override func beforeEach() {
        tapButton(buttonName: Name.EMAIL_LOGIN_BUTTON)
        expectToSeeSigInWithEmailVC()
    }
    
    override func afterEach() {
        tapButton(buttonName: Name.BACK_BUTTON)
        expectToHideSigInWithEmailVC()
        expectToSeeSigInVC()
    }
    
    /**
     Test if warning alert will be shown when user will not provide valid email login data on login screen
     */
    
    func testEmptyCardNumberField() {
        tapButton(buttonName: Name.LOGIN_WITH_EMAIL_BUTTON)
        expectToSeeAlert(text: Name.ERROR_MESSAGE)
        tapButton(buttonName: Name.DISMISS_BUTTON)
        expectToSeeSigInWithEmailVC()
    }
}
