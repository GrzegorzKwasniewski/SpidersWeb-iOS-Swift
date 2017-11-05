//
//  SpiderModel+CoreDataProperties.swift
//  SocialMediaApp
//
//  Created by serwis on 05/11/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import CoreData


extension SpiderModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SpiderModel> {
        return NSFetchRequest<SpiderModel>(entityName: "SpiderModel")
    }

    @NSManaged public var name: String?
    @NSManaged public var user: UserModel?

}
