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
    
    func expectToSeeSignInVC() {
        tester().waitForView(withAccessibilityLabel: Name.emailLoginButton)
    }
    
    /**
     Use to check if SigInWithEmailVC was hidden
     */
    
    func expectToHideSignInWithEmailVC() {
        tester().waitForAbsenceOfView(withAccessibilityLabel: Name.backButton)
        tester().waitForAbsenceOfView(withAccessibilityLabel: Name.signInLabel)
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
}

