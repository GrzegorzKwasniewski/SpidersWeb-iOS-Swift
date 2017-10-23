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
            var validJason: JsonObject!
            
            beforeEach {
                validJason = Spider.validJson()
            }
            
            it("should parse all properties") {
                
                spider = Spider(spiderId: "testId", spiderData: validJason)
                
                expect(spider.spiderId).to(equal("testId"))
                expect(spider.name).to(equal("testName"))
                expect(spider.genus).to(equal("testGenus"))
                expect(spider.species).to(equal("testSpecies"))
                expect(spider.commonName).to(equal("testCommonName"))
                expect(spider.countryOrigin).to(equal("testCountryOrigin"))
                expect(spider.group).to(equal("testGroup"))
                expect(spider.recivedFrom).to(equal("testRecivedFrom"))
                expect(spider.imageUrl).to(equal("testImageUrl"))
                expect(spider.dateRecived).to(equal(Spider.generateTestDate()))
                
            }
        }
    }

}
