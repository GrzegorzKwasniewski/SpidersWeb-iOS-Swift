//
//  File.swift
//  SocialMediaApp
//
//  Created by serwis on 16.11.2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import CoreData

class TestFetchRequests_3_way: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func populateDealsCountLabel() {
        
        // 1
        let fetchRequest =
            NSFetchRequest<NSDictionary>(entityName: "SpiderModel")
        fetchRequest.resultType = .dictionaryResultType
        
        // 2
        let sumExpressionDesc = NSExpressionDescription()
        sumExpressionDesc.name = "sumDeals"
        
        // tutaj to SpdierModel.user wstawiłeś trochę bez sensu, bo tu nie ma co liczyć, ale zostawiłeś dla zachowania przekazu
        let specialCountExp =
            NSExpression(forKeyPath: #keyPath(SpiderModel.user))
        
        // NSExpression zawiera wiele róznych funkcji poza sum: - jest jeszcze count, average, min, max - możesz sobie sprawdzić dokumentację
        sumExpressionDesc.expression =
            NSExpression(forFunction: "sum:",
                         arguments: [specialCountExp])
        
        sumExpressionDesc.expressionResultType =
            .integer32AttributeType
        
        // 4
        fetchRequest.propertiesToFetch = [sumExpressionDesc]
        
        // 5
        do {
            let results =
                try coreDataStack.managedContext.fetch(fetchRequest)
            let resultDict = results.first!
            let numDeals = resultDict["sumDeals"]!
        } catch let error as NSError {
            print("Count not fetch \(error), \(error.userInfo)")
        }
    }
}
