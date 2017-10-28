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
        
        beforeEach { exampleMetadata in
            print("README: Example number \(exampleMetadata.exampleIndex) is about to be run.")
        }
        
        beforeEach {
            spiderCollectionVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SpiderCollectionVC") as! SpiderCollectionVC
            
            spiderCollectionVC.dataService = DataServiceMock()
            
            _ = spiderCollectionVC.view

        }
        
        afterEach { exampleMetadata in
            print("README Example number \(exampleMetadata.exampleIndex) has run.")
        }
        
        describe("SpiderCollectionVC") {
            
            context("did load") {
                
                it("should set all delegates") {
   
                    expect(spiderCollectionVC.collectionView.delegate).to(beAKindOf(SpiderCollectionVC.self))
                    expect(spiderCollectionVC.collectionView.dataSource).to(beAKindOf(SpiderCollectionVC.self))
                    expect(spiderCollectionVC.searchBar.delegate).to(beAKindOf(SpiderCollectionVC.self))
                }
                
                it("should have proper number of spiders") {
                    
                    expect(spiderCollectionVC.spiders.count).toEventually(equal(5))
                    
                }
                
                it("should have proper number of sections") {
                    
                    expect(spiderCollectionVC.collectionView.numberOfSections).to(equal(1))
                    
                }
                
                it("should have proper number of items in first section") {
                    
                    expect(spiderCollectionVC.collectionView.numberOfItems(inSection: 0)).toEventually(equal(5))
                    
                }
            }
            
            context("spiders were filtered") {
                
                it("should set new number of itemes in collection view") {
                    
                    spiderCollectionVC.filteredSpiders = DataServiceMock.crateSpidersCollectionTestData()
                    
                    spiderCollectionVC.filteredSpiders.removeFirst()

                    spiderCollectionVC.inSearchMode = true
                    spiderCollectionVC.collectionView.reloadData()
                    
                    expect(spiderCollectionVC.collectionView.numberOfItems(inSection: 0)).toEventually(equal(4))
                }
            }
        }
    }
}
