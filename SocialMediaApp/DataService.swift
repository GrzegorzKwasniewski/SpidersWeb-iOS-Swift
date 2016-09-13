//
//  DataService.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 13/09/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import Firebase

// get url for databse from plist file - https://socialmediaapp-fcfde.firebaseio.com/
let DB_BASE = FIRDatabase.database().reference()

class DataService {

    static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")
    private var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: FIRDatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
        // if user don't exists Firebase will create one create user with proper uid
        REF_USERS.child(uid).updateChildValues(userData) // if users exists data will not overriden
    }

}
