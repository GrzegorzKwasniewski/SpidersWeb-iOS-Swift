//
//  CreateNewAccountVCTest.swift
//  SocialMediaApp
//
//  Created by serwis on 23/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import KIF
import Nimble

class CreateNewAccountVCUITest: BaseUITests {
    
    override func beforeAll() {
        tapButton(buttonName: Name.emailLoginButton)
        expectToSeeSignInWithEmailVC()
        tapButton(buttonName: Name.dontHaveAccount)
        expectToSeeCreateAccountVC()
    }
    
    override func afterAll() {
        tapButton(buttonName: Name.goBackToLoginScreen)
        expectToHideCreateNewAccountVC()
        expectToSeeSignInWithEmailVC()
        tapButton(buttonName: Name.backButton)
        expectToHideSignInWithEmailVC()
        expectToSeeSignInVC()
    }
    
    override func beforeEach() {
        clearOutAllFields()
    }
    
    
    /**
     Test if warning alert will be shown when user will not provide ANY email data
     */
    
    func testEmptyEmailAndPasswordField_ShowAlert() {
        tapButton(buttonName: Name.createAccountButton)
        expectToSeeAlert(text: Name.errorMessage)
        tapButton(buttonName: Name.dismissButton)
        expectToSeeCreateAccountVC()
    }
    
    /**
     Test if warning alert will be shown when user will provide INVALID    email data
     */
    
    func testInvalidEmailAndPasswordData_ShowAlert() {
        provideInvalidEmail()
        provideInvalidPassword()
        tapButton(buttonName: Name.createAccountButton)
        expectToSeeAlert(text: Name.errorMessage)
        tapButton(buttonName: Name.dismissButton)
        expectToSeeCreateAccountVC()
    }
}
