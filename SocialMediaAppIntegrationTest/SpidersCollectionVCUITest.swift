//
//  SpiderCollectionVCTest.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 28/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import KIF
import Nimble

class SpidersCollectionVCUITest: BaseUITests {

    override func beforeAll() {
        
        //logoutFromApp()
        
        tapButton(buttonName: Name.emailLoginButton)
        expectToSeeSignInWithEmailVC()
        provideValidEmail()
        provideValidPassword()
        tapButton(buttonName: Name.loginWithEmailButton)
        expectToSeeSpiderScollectionVC()
    }
    
    override func afterAll() {
        tapButton(buttonName: Name.logoutButton)
        expectToHideSpidersCollectionVC()
    }
    
    /**
    
    Test if User can logout form app
 
    */
    
    func testLogoutUserFromApp() {
        tapButton(buttonName: Name.logoutButton)
        expectToHideSpidersCollectionVC()
        expectToSeeSignInWithEmailVC()
    }
}
