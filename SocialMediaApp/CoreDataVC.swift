//
//  CoreDataTest.swift
//  SocialMediaApp
//
//  Created by serwis on 06/11/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import CoreData

var testManagedObject = CoreDataStack(modelName: "SpidersData").managedContext

class CoreDataVC: UIViewController {
    
    // to jest managed object
    // masz do niego utworzoną klasę pomocniczą, tak być mógł korzystać bez problemu z jego pól zamiast korzystać z key-value
    var currentSpider: SpiderModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let spiderName = "Fido"
        
        let spiderFetch: NSFetchRequest<SpiderModel> = SpiderModel.fetchRequest()
        
        spiderFetch.predicate = NSPredicate(format: "%K == %@", #keyPath(SpiderModel.name), spiderName)
        
        do {
            let results = try testManagedObject.fetch(spiderFetch)
            if results.count > 0 {
                // Fido found, use Fido
                currentSpider = results.first
            } else {
                // Fido not found, create Fido
                currentSpider = SpiderModel(context: testManagedObject)
                currentSpider?.name = spiderName
                try testManagedObject.save()
            }
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // tutaj wypisujesz tak sobie dla próby
        // to jest ten spider pobrany z bazy danych lub utworzony jeżeli takiego nie było
        print("\(String(describing: currentSpider?.name))")
    }
    
    func dodajSobieCosNaProbe() {
        
        // Insert a new Walk entity into Core Data
        let user = UserModel(context: testManagedObject)
        
        user.name = "Leszek"
        
        // Insert the new Walk into the Dog's walks set
        
        // cały ten if-let jest pokazany tylko dla demonstracji - możesz go zastąpić poniższą metodą tworzoną dla nas automatycznie podczas tworzenia klas pomocniczych dla naszych managed objects
        //user.addToSpiders(currentSpider)
        
        // relacja on-to-many + ordered jest typu NSOrderedSet i domyślnie jest immutable - stąd tyle z tym zabawy 
        if let spider = currentSpider,
            let spiders = user.spiders?.mutableCopy()
                as? NSMutableOrderedSet {
            spiders.add(spider)
            user.spiders = spiders
        }
        
        // Save the managed object context
        do {
            try testManagedObject.save()
        } catch let error as NSError {
            print("Save error: \(error),description: \(error.userInfo)")
        }
    }
    
    func usunSobieCos() {
        
        // to tak sobie na próbę bez sensu usuwam
        testManagedObject.delete(self.currentSpider!)
        
        do { //3
            try testManagedObject.save()
            //4
            // jak masz jakąś kolekcję do przechwywania managed objects to możesz sobie z niej teraz usunąć
        } catch let error as NSError {
            print("Saving error: \(error), description: \(error.userInfo)")
        }
    }
}
