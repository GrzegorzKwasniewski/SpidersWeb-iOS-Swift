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
        
    init(spiderId: String?, spiderData: [String: Any]) {
        
        self.spiderId = spiderId ?? "no data"
        
        self.spiderUid = spiderData["spiderUid"] as? String ?? "no data"
        self.name = spiderData["name"] as? String ?? "no data"
        self.genus = spiderData["genus"] as? String ?? "no data"
        self.species = spiderData["species"] as? String ?? "no data"
        self.commonName = spiderData["commonName"] as? String ?? "no data"
        self.countryOrigin = spiderData["countryOrigin"] as? String ?? "no data"
        self.group = spiderData["group"] as? String ?? "no data"
        self.recivedFrom = spiderData["recivedFrom"] as? String ?? "no data"
        self.dateRecived = spiderData["dateRecived"] as? Date ?? Spider.generateDefaultDate()
        self.imageUrl = spiderData["imageUrl"] as? String ?? "no data"
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
            "dateRecived": generateDefaultDate(),
            "imageUrl": "testImageUrl"
        ]
    }
    
    static func generateDefaultDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.date(from: "20170101")!
    }
}

