//
//  Globals.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 21/12/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation

enum AuthProvider {
    case Firebase
    case Twitter
    case Facebook
    case Google
}

var authProvider: AuthProvider = .Firebase
