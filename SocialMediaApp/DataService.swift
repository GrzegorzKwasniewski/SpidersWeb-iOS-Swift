//
//  DataService.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 26/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation

protocol DataService {
    
    func downloadSpidersData(forUser userUID: String, completion: @escaping (_ spiderCollection: [Spider]) -> Void)
    
}
