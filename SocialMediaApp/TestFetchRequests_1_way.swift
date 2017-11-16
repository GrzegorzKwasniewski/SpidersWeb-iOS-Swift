//
//  TestFetchRequests.swift
//  SocialMediaApp
//
//  Created by serwis on 11.11.2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import CoreData

class TestFetchRequests_1_way: UIViewController {
    
    // przygotowanie do pobierania danych - to jest pierwszy sposób
    var fetchRequest: NSFetchRequest<SpiderModel>!
    var spiders: [SpiderModel]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // tutaj sprawdzamy, czy jest w naszym graficznym modelu utworzone fetch request o nazwie FetchAllSpiders
        
        // ale podstawowe fetch request możesz utworzyć tak
        //fetchRequest = SpiderModel.fetchRequest()
        
        guard let model =
            testManagedObjectContext
                .persistentStoreCoordinator?.managedObjectModel,
            let fetchRequest = model
                .fetchRequestTemplate(forName: "FetchAllSpiders")
                as? NSFetchRequest<SpiderModel> else {
                    return
        }
        self.fetchRequest = fetchRequest
        fetchSpidersData()
    }
}

// MARK: - Helper methods
extension TestFetchRequests_1_way {
    
    func fetchSpidersData() {
        do {
            spiders =
            try testManagedObjectContext.fetch(fetchRequest)
            
            //// tutja możesz już sobie coś zrobić ze Spiderami
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    } }
