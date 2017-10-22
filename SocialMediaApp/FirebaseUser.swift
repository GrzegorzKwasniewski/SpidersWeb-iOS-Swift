//
//  User.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 14/10/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import Firebase

public struct FirebaseUser {

    private(set) var uid: String
    private(set) var display_name: String
    private(set) var email: String
    private(set) var image: UIImage
    
    init() {
        self.uid = ""
        self.display_name = ""
        self.email = ""
        self.image = #imageLiteral(resourceName: "default-avatar")
    }
    
    init(userUid uid: String, userDisplayName name: String, userEmail email: String, userImage image: UIImage) {
        self.uid = uid
        self.display_name = name
        self.email = email
        self.image = image
    }
}
