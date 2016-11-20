//
//  RegEx.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 10/11/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation

enum TypeOfStringToValidate {
    case emailAddress
    case userDisplayName
}

class RegEx {

    static let sharedInstance = RegEx()
    
    func validteString(emailAddress: String, typeOfString: TypeOfStringToValidate) -> Bool {
        
        var regExPattern = String()
        
        switch typeOfString {
        case .emailAddress:
            regExPattern = "[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"
        case .userDisplayName:
            regExPattern = "^[a-z][A-Z]{0,10}$"
        }
        
        var regEx:NSRegularExpression?
        
        do {
            
            regEx? = try NSRegularExpression(pattern: regExPattern, options: .caseInsensitive)
            
        } catch let error {
            print("README: Error while validating Regex \(error)")
        }

        let range = NSMakeRange(0, emailAddress.characters.count)
        let matchRange = regEx?.rangeOfFirstMatch(in: emailAddress, options: .reportProgress, range: range)
        let valid = matchRange?.location != NSNotFound
        
        print("README: \(valid)")
        
        return valid

    }


}
