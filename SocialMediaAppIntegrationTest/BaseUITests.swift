//
//  BaseUITests.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 19/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import KIF
import Nimble

class BaseUITests: KIFTestCase {}

extension BaseUITests {
    
    /**
     Use to remove text from all text fields
     */
    
    func clearOutAllFields() {
        tester().clearTextFromView(withAccessibilityLabel: Name.emailField)
        tester().clearTextFromView(withAccessibilityLabel: Name.passwordField)
    }
    
    /**
     Use to fill email field with valid email
     */
    
    func provideValidEmail() {
        tester().enterText("g5@wp.pl", intoViewWithAccessibilityLabel: Name.emailField)
    }
    
    /**
     Use to fill password field with valid password
     */
    
    func provideValidPassword() {
        tester().enterText("Coding56", intoViewWithAccessibilityLabel: Name.passwordField)
    }
    
    /**
     Use to fill email field with invalid email
     */
    
    func provideInvalidEmail() {
        tester().enterText("user.com", intoViewWithAccessibilityLabel: Name.emailField)
    }
    
    /**
     Use to fill email field with invalid email
     */
    
    func provideInvalidPassword() {
        tester().enterText("rt", intoViewWithAccessibilityLabel: Name.passwordField)
    }
    
    /**
     Use to check if SigInWithEmailVC is now in front
     */
    
    func expectToSeeSignInWithEmailVC() {
        tester().waitForView(withAccessibilityLabel: Name.signInLabel)
        tester().waitForView(withAccessibilityLabel: Name.emailField)
        tester().waitForView(withAccessibilityLabel: Name.passwordField)
    }
    
    /**
     Use to check if SigInVC is now in front
     */
    
    func expectToSeeSignInVC() {
        tester().waitForView(withAccessibilityLabel: Name.emailLoginButton)
    }
    
    /**
     Use to check if SigInWithEmailVC is now in front
     */
    
    func expectToSeeCreateAccountVC() {
        tester().waitForView(withAccessibilityLabel: Name.emailField)
        tester().waitForView(withAccessibilityLabel: Name.passwordField)
        tester().waitForView(withAccessibilityLabel: Name.createAccountButton)
    }
    
    /**
     Use to check if CreateNewAccountVC was hidden
     */
    
    func expectToSeeSpiderScollectionVC() {
        tester().waitForView(withAccessibilityLabel: Name.userAvatarImage)
        tester().waitForView(withAccessibilityLabel: Name.addSpiderButton)
        tester().waitForView(withAccessibilityLabel: Name.logoutButton)
    }
    
    /**
     Use to check if SigInWithEmailVC was hidden
     */
    
    func expectToHideSignInWithEmailVC() {
        tester().waitForAbsenceOfView(withAccessibilityLabel: Name.backButton)
        tester().waitForAbsenceOfView(withAccessibilityLabel: Name.signInLabel)
    }
    
    /**
     Use to check if CreateNewAccountVC was hidden
     */
    
    func expectToHideCreateNewAccountVC() {
        tester().waitForAbsenceOfView(withAccessibilityLabel: Name.emailField)
        tester().waitForAbsenceOfView(withAccessibilityLabel: Name.passwordField)
        tester().waitForAbsenceOfView(withAccessibilityLabel: Name.createAccountButton)
        tester().waitForAbsenceOfView(withAccessibilityLabel: Name.goBackToLoginScreen)
    }
    
    /**
     Use to check if SpiderSCollectionVC was hidden
     */
    
    func expectToHideSpidersCollectionVC() {
        tester().waitForAbsenceOfView(withAccessibilityLabel: Name.userAvatarImage)
        tester().waitForAbsenceOfView(withAccessibilityLabel: Name.addSpiderButton)
        tester().waitForAbsenceOfView(withAccessibilityLabel: Name.logoutButton)
    }
    
    /**
     Use to interact with button
     
     - Parameter buttonName: value of accessibility label for searched button
     */
    
    func tapButton(buttonName: String) {
        tester().tapView(withAccessibilityLabel: buttonName)
    }
    
    /**
     Use to check if specified alert is in front
     
     - Parameter text: use this to specify alert message that should be shown
     */
    
    func expectToSeeAlert(text: String) {
        tester().waitForView(withAccessibilityLabel: text)
    }
    
    /**
     Use to check if card number filed has any value
     */
    
    func checkIfCardNumberFieldHasAnyValue() {
        let cardNumberField = tester().waitForView(withAccessibilityLabel: Name.CARD_NUMBER_FIELD) as! UITextField
        
        expect(cardNumberField.text) != ""
    }
    
    func logoutFromApp() {
        if let _ = tester().waitForView(withAccessibilityLabel: Name.logoutButton) as? UIButton {
            tester().tapView(withAccessibilityLabel: Name.logoutButton)
        }
    }
}

