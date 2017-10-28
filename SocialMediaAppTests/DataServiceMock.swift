//
//  DataServiceMock.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 26/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import Firebase
import SwiftKeychainWrapper

class DataServiceMock: DataService {
        
    func downloadSpidersData(forUser userUID: String, completion: @escaping (_ spiderCollection: [Spider]) -> Void) {
        
        print("README: mock")
        
        let spiders = DataServiceMock.crateSpidersTestData()
        
        completion(spiders)
        
    }
    
    func downloadSpiderImage(fromURL url: String, completion: @escaping (UIImage) -> Void) {}
}

extension DataServiceMock {

    static func crateSpidersTestData() -> [Spider] {
        var spiderData = [String: AnyObject]()
        spiderData["spiderUid"] = "uid" as AnyObject
        spiderData["name"] = "name" as AnyObject
        spiderData["genus"] = "genus" as AnyObject
        spiderData["species"] = "species" as AnyObject
        spiderData["commonName"] = "commonName" as AnyObject
        spiderData["countryOrigin"] = "countryOrigin" as AnyObject
        spiderData["group"] = "group" as AnyObject
        spiderData["recivedFrom"] = "recivedFrom" as AnyObject
        spiderData["dateRecived"] = Spider.generateDefaultDate() as AnyObject
        spiderData["imageUrl"] = "imageUrl" as AnyObject
        
        let spiders = [
            Spider(spiderId: "1", spiderData: spiderData),
            Spider(spiderId: "2", spiderData: spiderData),
            Spider(spiderId: "3", spiderData: spiderData),
            Spider(spiderId: "4", spiderData: spiderData),
            Spider(spiderId: "5", spiderData: spiderData)
        ]
        
        return spiders
    }
}
