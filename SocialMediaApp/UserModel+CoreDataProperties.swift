//
//  UserModel+CoreDataProperties.swift
//  SocialMediaApp
//
//  Created by serwis on 05/11/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import CoreData


extension UserModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserModel> {
        return NSFetchRequest<UserModel>(entityName: "UserModel")
    }

    @NSManaged public var name: String?
    @NSManaged public var spiders: NSOrderedSet?

}

// MARK: Generated accessors for spiders
extension UserModel {

    @objc(insertObject:inSpidersAtIndex:)
    @NSManaged public func insertIntoSpiders(_ value: SpiderModel, at idx: Int)

    @objc(removeObjectFromSpidersAtIndex:)
    @NSManaged public func removeFromSpiders(at idx: Int)

    @objc(insertSpiders:atIndexes:)
    @NSManaged public func insertIntoSpiders(_ values: [SpiderModel], at indexes: NSIndexSet)

    @objc(removeSpidersAtIndexes:)
    @NSManaged public func removeFromSpiders(at indexes: NSIndexSet)

    @objc(replaceObjectInSpidersAtIndex:withObject:)
    @NSManaged public func replaceSpiders(at idx: Int, with value: SpiderModel)

    @objc(replaceSpidersAtIndexes:withSpiders:)
    @NSManaged public func replaceSpiders(at indexes: NSIndexSet, with values: [SpiderModel])

    @objc(addSpidersObject:)
    @NSManaged public func addToSpiders(_ value: SpiderModel)

    @objc(removeSpidersObject:)
    @NSManaged public func removeFromSpiders(_ value: SpiderModel)

    @objc(addSpiders:)
    @NSManaged public func addToSpiders(_ values: NSOrderedSet)

    @objc(removeSpiders:)
    @NSManaged public func removeFromSpiders(_ values: NSOrderedSet)

}
