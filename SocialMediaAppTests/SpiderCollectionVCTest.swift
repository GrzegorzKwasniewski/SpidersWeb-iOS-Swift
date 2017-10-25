//
//  SpiderCollectionVCTest.swift
//  SocialMediaApp
//
//  Created by serwis on 25/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import SocialMediaApp

class SpiderCollectionVCTest: QuickSpec {
    
    override func spec() {
        
        var spiderCollectionVC: SpiderCollectionVC!
        
        describe("SpiderCollectionVC") {
            
            beforeEach {
                spiderCollectionVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SpiderCollectionVC") as! SpiderCollectionVC
                
                _ = spiderCollectionVC.view
            }
            
            describe("did load") {
                
                it("should set all delegates") {
                    expect(spiderCollectionVC.collectionView.delegate).to(beAKindOf(SpiderCollectionVC.self))
                    expect(spiderCollectionVC.collectionView.dataSource).to(beAKindOf(SpiderCollectionVC.self))
                    expect(spiderCollectionVC.searchBar.delegate).to(beAKindOf(SpiderCollectionVC.self))
                }
            }
        }
    }
}
