//
//  Spider.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 04/01/17.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import FirebaseDatabase

public struct Spider {
    
    private(set) var spiderUid: String = ""
    private(set) var spiderId: String = ""
    private(set) var name: String = ""
    private(set) var genus: String = ""
    private(set) var species: String = ""
    private(set) var commonName: String = ""
    private(set) var countryOrigin: String = ""
    private(set) var group: String = ""
    private(set) var recivedFrom: String = ""
    private(set) var dateRecived: Date = Date()
    private(set) var imageUrl: String = ""
    
    init() {}
    
    init(spiderId: String, spiderData: [String: Any]) {
        
        self.spiderId = spiderId
        
        if let spiderUid = spiderData["spiderUid"] as? String {
            self.spiderUid = spiderUid
        }
        
        if let name = spiderData["name"] as? String {
            self.name = name
        }
        
        if let genus = spiderData["genus"] as? String {
            self.genus = genus
        }
        
        if let species = spiderData["species"] as? String {
            self.species = species
        }
        
        if let commonName = spiderData["commonName"] as? String {
            self.commonName = commonName
        }
        
        if let countryOrigin = spiderData["countryOrigin"] as? String {
            self.countryOrigin = countryOrigin
        }
        
        if let group = spiderData["group"] as? String {
            self.group = group
        }
        
        if let recivedFrom = spiderData["recivedFrom"] as? String {
            self.recivedFrom = recivedFrom
        }
        
        if let dateRecived = spiderData["dateRecived"] as? Date {
            self.dateRecived = dateRecived
        }
        
        if let imageUrl = spiderData["imageUrl"] as? String {
            self.imageUrl = imageUrl
        }
    }
}

extension Spider {
    
    static func validJson() -> JsonObject {
        
        return [
            "spiderUid": "testUid",
            "name": "testName",
            "genus": "testGenus",
            "species": "testSpecies",
            "commonName": "testCommonName",
            "countryOrigin": "testCountryOrigin",
            "group": "testGroup",
            "recivedFrom": "testRecivedFrom",
            "dateRecived": generateTestDate(),
            "imageUrl": "testImageUrl"
        ]
    }
    
    static func generateTestDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.date(from: "20170101")!
    }
}

