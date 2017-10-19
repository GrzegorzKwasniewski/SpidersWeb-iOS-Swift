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
        tester().clearTextFromView(withAccessibilityLabel: Name.CARD_NUMBER_FIELD)
        tester().clearTextFromView(withAccessibilityLabel: Name.CARD_VALID_MONTH_FIELD)
        tester().clearTextFromView(withAccessibilityLabel: Name.CARD_VALID_YEAR_FIELD)
        tester().clearTextFromView(withAccessibilityLabel: Name.CARD_CVC_FIELD)
    }
    
    /**
     Use to fill card number field with invalid card number
     */
    
    func provideInvalidCardNumber() {
        tester().enterText("93588374", intoViewWithAccessibilityLabel: Name.CARD_NUMBER_FIELD)
    }
    
    /**
     Use to fill card number field with valid card number
     */
    
    func provideValidCardNumber() {
        tester().enterText("4028930493049304", intoViewWithAccessibilityLabel: Name.CARD_NUMBER_FIELD)
    }
    
    /**
     Use to fill card number field with invalid data
     */
    
    func provideOtherValuesThanNumber() {
        tester().enterText("Sflocldls", intoViewWithAccessibilityLabel: Name.CARD_NUMBER_FIELD)
    }
    
    /**
     Use to check if card validation view is now in front
     */
    
    func expectToSeeCardValidationView() {
        tester().waitForView(withAccessibilityLabel: Name.VALIDATE_BUTTON)
    }
    
    /**
     Use to check if result alert view was hidden
     */
    
    func expectToHideResultAlert() {
        tester().waitForAbsenceOfView(withAccessibilityLabel: Name.RESULT_VIEW_MESSAGE)
        tester().waitForAbsenceOfView(withAccessibilityLabel: Name.DISMISS_BUTTON)
    }
    
    /**
     Use to check if warning alert was hidden
     */
    
    func expectToHideWarningAlert() {
        tester().waitForAbsenceOfView(withAccessibilityLabel: Name.WARNING_MESSAGE_LABEL)
        tester().waitForAbsenceOfView(withAccessibilityLabel: Name.DISMISS_BUTTON)
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

