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
                
            }
            
            describe("did load") {
                
                it("should set all delegates") {
                    
                    spiderCollectionVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SpiderCollectionVC") as! SpiderCollectionVC
                    
                    _ = spiderCollectionVC.view
                    
                    expect(spiderCollectionVC.collectionView.delegate).to(beAKindOf(SpiderCollectionVC.self))
                    expect(spiderCollectionVC.collectionView.dataSource).to(beAKindOf(SpiderCollectionVC.self))
                    expect(spiderCollectionVC.searchBar.delegate).to(beAKindOf(SpiderCollectionVC.self))
                }
            }
            
            describe("collection view") {
                
                it("collectionView should have proper number of sections") {
                    
                    let mockDataService = 
                    
                    spiderCollectionVC = SpiderCollectionVC(withDataService: <#T##DataService#>)
                    expect(spiderCollectionVC.collectionView.numberOfSections).to(equal(1))
                }
            }
        }
    }
}
