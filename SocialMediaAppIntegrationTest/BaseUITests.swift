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
        tester().clearTextFromView(withAccessibilityLabel: Name.EMAIL_FIELD)
        tester().clearTextFromView(withAccessibilityLabel: Name.PASSWORD_FIELD)
    }
    
    /**
     Use to fill email field with invalid email
     */
    
    func provideInvalidEmail() {
        tester().enterText("user.com", intoViewWithAccessibilityLabel: Name.EMAIL_FIELD)
    }
    
    /**
     Use to fill email field with invalid email
     */
    
    func provideInvalidPassword() {
        tester().enterText("rt", intoViewWithAccessibilityLabel: Name.PASSWORD_FIELD)
    }
    
    /**
     Use to check if SigInWithEmailVC is now in front
     */
    
    func expectToSeeSigInWithEmailVC() {
        tester().waitForView(withAccessibilityLabel: Name.SIGN_IN_LABEL)
        tester().waitForView(withAccessibilityLabel: Name.EMAIL_FIELD)
        tester().waitForView(withAccessibilityLabel: Name.PASSWORD_FIELD)
    }
    
    func expectToSeeSigInVC() {
        tester().waitForView(withAccessibilityLabel: Name.EMAIL_LOGIN_BUTTON)
    }
    
    /**
     Use to check if SigInWithEmailVC was hidden
     */
    
    func expectToHideSigInWithEmailVC() {
        tester().waitForAbsenceOfView(withAccessibilityLabel: Name.BACK_BUTTON)
        tester().waitForAbsenceOfView(withAccessibilityLabel: Name.SIGN_IN_LABEL)
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
    
    /**
     Use to check if card number filed is empty
     */
    
    func checkIfCardNumberFieldIsEmpty() {
        let cardNumberField = tester().waitForView(withAccessibilityLabel: Name.CARD_NUMBER_FIELD) as! UITextField
        
        expect(cardNumberField.text) == ""
    }
    
    /**
     Use to check if proper message is displyed when user provide invalid credit card number
     */
    
    func checkIfInvalidCardMessageIsDisplayed() {
        let message = tester().waitForView(withAccessibilityLabel: Name.RESULT_VIEW_MESSAGE) as! UILabel
        
        // binocode can change their error message so we check if diplayed message
        // is not indicating success
        expect(message.text) != Name.CARD_CONFIRMED
    }
}

