//
//  TestFetchRequests_2_way.swift
//  SocialMediaApp
//
//  Created by serwis on 11.11.2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit

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
}
