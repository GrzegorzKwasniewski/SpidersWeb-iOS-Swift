//
//  String.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 28/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {

    func isNilOrEmpty() -> Bool {
        if self == nil || self == "" {
            return true
        } else {
            return false
        }
    }
}
