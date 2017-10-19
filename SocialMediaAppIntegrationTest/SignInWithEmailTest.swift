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
    
    override func beforeAll() {
        tapButton(buttonName: Name.EMAIL_LOGIN_BUTTON)
        expectToSeeSignInWithEmailVC()
    }
    
    override func afterAll() {
        tapButton(buttonName: Name.BACK_BUTTON)
        expectToHideSignInWithEmailVC()
        expectToSeeSignInVC()
    }
    
    override func beforeEach() {
        clearOutAllFields()
    }
    
    
    /**
     Test if warning alert will be shown when user will not provide ANY email login data on login screen
     */
    
    func testEmptyEmailAndPasswordField_ShowAlert() {
        tapButton(buttonName: Name.LOGIN_WITH_EMAIL_BUTTON)
        expectToSeeAlert(text: Name.ERROR_MESSAGE)
        tapButton(buttonName: Name.DISMISS_BUTTON)
        expectToSeeSignInWithEmailVC()
    }
    
    /**
     Test if warning alert will be shown when user will provide INVALID    email login data on login screen
     */
    
    func testInvalidEmailAndPasswordData_ShowAlert() {
        provideInvalidEmail()
        provideInvalidPassword()
        tapButton(buttonName: Name.LOGIN_WITH_EMAIL_BUTTON)
        expectToSeeAlert(text: Name.ERROR_MESSAGE)
        tapButton(buttonName: Name.DISMISS_BUTTON)
        expectToSeeSignInWithEmailVC()
    }
}
