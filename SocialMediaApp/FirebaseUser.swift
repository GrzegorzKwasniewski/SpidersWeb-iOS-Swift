//
//  User.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 14/10/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import Firebase

class FirebaseUser {

    private var _uid: String!
    private var _display_name: String!
    private var _email: String!
    private var _image: UIImage!
    private var _photo_url: URL!
    
    var uid: String {
        return _uid
    }

    var display_name: String {
        return _display_name
    }
    
    var email: String {
        return _email
    }
    
    var image: UIImage {
        return _image
    }
    
    var photo_url: URL {
        return _photo_url
    }
    
    init() {}
    
    init(userUid uid: String, userDisplayName name: String, userEmail email: String, userImage image: UIImage) {
        _uid = uid
        _display_name = name
        _email = email
        _image = image
    }

}
