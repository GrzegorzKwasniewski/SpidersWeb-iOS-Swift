//
//  SpiderModelTest.swift
//  SocialMediaApp
//
//  Created by serwis on 23/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import SocialMediaApp

class SpiderModelTest: QuickSpec {

    override func spec() {
        
        describe("Spider model struct") {
            
            var spider: Spider!
            var validJSON: JsonObject!
            var invalidJSON: JsonObject!
            
            beforeEach {
                validJSON = Spider.validJson()
                invalidJSON = Spider.invalidJson()
            }
            
            context("when valid data is passed") {
                
                it("should parse successfully all properties") {
                    
                    spider = Spider(spiderId: "testId", spiderData: validJSON)
                    
                    expect(spider.spiderId).to(equal("testId"))
                    expect(spider.name).to(equal("testName"))
                    expect(spider.genus).to(equal("testGenus"))
                    expect(spider.species).to(equal("testSpecies"))
                    expect(spider.commonName).to(equal("testCommonName"))
                    expect(spider.countryOrigin).to(equal("testCountryOrigin"))
                    expect(spider.group).to(equal("testGroup"))
                    expect(spider.recivedFrom).to(equal("testRecivedFrom"))
                    expect(spider.imageUrl).to(equal("testImageUrl"))
                    expect(spider.dateRecived).to(equal(Spider.generateDefaultDate()))
                    
                }
            }
            
            context("when invalid data is passed") {
            
                it("should set all properties to default value") {
                    
                    spider = Spider(spiderId: nil, spiderData: invalidJSON)
                    
                    expect(spider.spiderId).to(equal("no data"))
                    expect(spider.name).to(equal("no data"))
                    expect(spider.genus).to(equal("no data"))
                    expect(spider.species).to(equal("no data"))
                    expect(spider.commonName).to(equal("no data"))
                    expect(spider.countryOrigin).to(equal("no data"))
                    expect(spider.group).to(equal("no data"))
                    expect(spider.recivedFrom).to(equal("no data"))
                    expect(spider.imageUrl).to(equal("no data"))
                    expect(spider.dateRecived).to(equal(Spider.generateDefaultDate()))

                }
            }
            
            context("when nil vaule is passed") {
                
                it("should initialize with default data") {
                    
                    spider = Spider(spiderId: nil, spiderData: [:])
                    
                    expect(spider.spiderId).to(equal("no data"))
                    expect(spider.name).to(equal("no data"))
                    expect(spider.genus).to(equal("no data"))
                    expect(spider.species).to(equal("no data"))
                    expect(spider.commonName).to(equal("no data"))
                    expect(spider.countryOrigin).to(equal("no data"))
                    expect(spider.group).to(equal("no data"))
                    expect(spider.recivedFrom).to(equal("no data"))
                    expect(spider.imageUrl).to(equal("no data"))
                    expect(spider.dateRecived).to(equal(Spider.generateDefaultDate()))
                }
            }
        }
    }
}
