//
//  RegEx.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 10/11/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation

class RegEx {

    static let sharedInstance = RegEx()
    
    func validteEmailAddress(emailAddress: String) -> Bool {
        let regExPattern = "[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"
        var regEx:NSRegularExpression?
        
        do {
            
            regEx? = try NSRegularExpression(pattern: regExPattern, options: .caseInsensitive)
            
        } catch {
            
        }

        let range = NSMakeRange(0, emailAddress.characters.count)
        let matchRange = regEx?.rangeOfFirstMatch(in: emailAddress, options: .reportProgress, range: range)
        let valid = matchRange?.location != NSNotFound
        
        print("README: \(valid)")
        
        return valid

    }


}
