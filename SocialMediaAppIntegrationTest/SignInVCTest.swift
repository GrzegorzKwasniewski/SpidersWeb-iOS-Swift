//
//  SignInVCTest.swift
//  SocialMediaApp
//
//  Created by serwis on 19/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import KIF
import Nimble

class SignInVCTest: BaseUITests {
    
    func testNavigationToSignInWithEmailVC() {
        tapButton(buttonName: Name.emailLoginButton)
        expectToSeeSignInWithEmailVC()
        tapButton(buttonName: Name.backButton)
    }
}
