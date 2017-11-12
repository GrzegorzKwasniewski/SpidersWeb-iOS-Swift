//
//  TestFetchRequests_2_way.swift
//  SocialMediaApp
//
//  Created by serwis on 11.11.2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import CoreData

class TestFetchRequests_2_way: UIViewController {
    
    /// to jest 2 sposób pobierania danych z predicates
    
    // muszę dokładnie sprawdzić jak to działa, ale wstępnie wygląda na to, że ten predicate pobiera wszystkie obikety Spiderów, których nazwy rozpoczynają się na literę "M"
    
    // %@ is a var arg substitution for an object value—often a string, number, or date.
    // %K is a var arg substitution for a key path.
    
    // wychodzi na to, że po lewej stronie równania będzie #keyPath(SpiderModel.name), a po prawej będzie "M"
    lazy var someFetchForSpiders: NSPredicate = {
        return NSPredicate(format: "%K == %@",
                           #keyPath(SpiderModel.name), "M")
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // A tutaj masz funckję, która wykorzystuje drugi sposób pobierania danych, który tylko wylicza ile rekordów spwłnia dany wymog
    func countObjectsThatMatchPredicate() {
        // zwroc uwage, ze jak argument generyka podany jest NSNumber, a nie SpiderModel
        let fetchRequest =
            NSFetchRequest<NSNumber>(entityName: "SpiderModel")
        fetchRequest.resultType = .countResultType
        fetchRequest.predicate = someFetchForSpiders
        do {
            let countResult =
                try testManagedObjectContext.fetch(fetchRequest)
            let count = countResult.first!.intValue
            
            /// i tutaj mozesz cos sobie z ta wartoscia zrobic
            
        } catch let error as NSError {
            print("Count not fetch \(error), \(error.userInfo)")
        }
    }
    
    func jeszczeInnySposobNaLiczenie() {
        func populateExpensiveVenueCountLabel() {
            let fetchRequest: NSFetchRequest<SpiderModel> = SpiderModel.fetchRequest()
            fetchRequest.predicate = someFetchForSpiders
            
            do {
                let count =
                    try testManagedObjectContext.count(for: fetchRequest)
                
                /// mozesz cos zrobic z count
                
            } catch let error as NSError {
                print("Count not fetch \(error), \(error.userInfo)")
            }
        }
    }
}
