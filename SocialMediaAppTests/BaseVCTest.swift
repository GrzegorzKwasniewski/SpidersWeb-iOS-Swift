//
//  BaseVCTest.swift
//  SocialMediaApp
//
//  Created by serwis on 29/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Quick
import Nimble

@testable import SocialMediaApp

class BaseVCTest: QuickSpec {

    override func spec() {
        
        var baseVC: BaseVC!
        
        describe("Base View Controller") { 
            
            beforeEach {
                baseVC = BaseVC()
            }
            
            context("created with default init", closure: { 
                
                it("should have proper background color") {
                    
                    let viewBackgroundColor = baseVC.view.layer.backgroundColor
                    
                    let expectedBackgroundColor = Colors.mainBackgroundColor.cgColor
                    
                    expect(viewBackgroundColor).to(equal(expectedBackgroundColor))
                }
            })
        }
    }
}
