//
//  DataService.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 13/09/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import Firebase
import SwiftKeychainWrapper

// get url for databse from plist file - https://socialmediaapp-fcfde.firebaseio.com/
let DB_BASE = FIRDatabase.database().reference()
let STORAGE_BASE = FIRStorage.storage().reference()

class DataService {

    static let ds = DataService()
    
    // DB refernces
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")
    private var _REF_USERS = DB_BASE.child("users")
    
    // STORAGE references
    private var _REF_POST_IMAGES = STORAGE_BASE.child("posts-pictures")
    private var _REF_USERS_AVATARS = STORAGE_BASE.child("users-avatars")
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: FIRDatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    var REF_USER_CURRENT: FIRDatabaseReference {
        let uid = KeychainWrapper.stringForKey(KEY_UID)
        //let uid = KeychainWrapper.set(KEY_UID)
        //let uid = KeychainWrapper.defaultKeychainWrapper.string(forKey: KEY_UID)
        let user = REF_USERS.child(uid!)
        return user
    }
    
    var REF_POST_IMAGES: FIRStorageReference {
        return _REF_POST_IMAGES
    }
    
    var REF_USERS_AVATARS: FIRStorageReference {
        return _REF_USERS_AVATARS
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
        // if user don't exists Firebase will create one create user with proper uid
        REF_USERS.child(uid).updateChildValues(userData) // if users exists data will not overriden
    }

}
