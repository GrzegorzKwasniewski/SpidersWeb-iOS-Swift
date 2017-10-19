//
//  SignInWithEmailTest.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 19/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import KIF
import Nimble

class SignInWithEmailTest: BaseUITests {
    
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
    
    
    /**
     Test if warning alert will be shown when user will not provide ANY email login data on login screen
     */
    
    func testEmptyEmailAndPasswordField_ShowAlert() {
        tapButton(buttonName: Name.loginWithEmailButton)
        expectToSeeAlert(text: Name.errorMessage)
        tapButton(buttonName: Name.dismissButton)
        expectToSeeSignInWithEmailVC()
    }
    
    /**
     Test if warning alert will be shown when user will provide INVALID    email login data on login screen
     */
    
    func testInvalidEmailAndPasswordData_ShowAlert() {
        provideInvalidEmail()
        provideInvalidPassword()
        tapButton(buttonName: Name.loginWithEmailButton)
        expectToSeeAlert(text: Name.errorMessage)
        tapButton(buttonName: Name.dismissButton)
        expectToSeeSignInWithEmailVC()
    }
}
