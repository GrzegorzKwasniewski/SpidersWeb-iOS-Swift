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
    private var _REF_SPIDERS = DB_BASE.child("spiders")
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_POSTS = DB_BASE.child("posts")
    
    // STORAGE references
    private var _REF_SPIDERS_IMAGES = STORAGE_BASE.child("spiders-images")
    private var _REF_POST_IMAGES = STORAGE_BASE.child("posts-pictures")
    private var _REF_USERS_AVATARS = STORAGE_BASE.child("users-avatars")
    
    private var currentUserUid: String!
    private var userName: String!
    private var userEmail: String!
    private var userImage: UIImage!
    private var photoUrlForFirebase: String?
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_SPIDERS: FIRDatabaseReference {
        return _REF_SPIDERS
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    var REF_POSTS: FIRDatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USER_CURRENT: FIRDatabaseReference {
        let uid = KeychainWrapper.stringForKey(KEY_UID)
        //let uid = KeychainWrapper.set(KEY_UID)
        //let uid = KeychainWrapper.defaultKeychainWrapper.string(forKey: KEY_UID)
        let user = REF_USERS.child(uid!)
        return user
    }
    
    var REF_SPIDERS_IMAGES: FIRStorageReference {
        return _REF_SPIDERS_IMAGES
    }
    
    var REF_POST_IMAGES: FIRStorageReference {
        return _REF_POST_IMAGES
    }
    
    var REF_USERS_AVATARS: FIRStorageReference {
        return _REF_USERS_AVATARS
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
        // if user don't exists Firebase will create one with proper uid
        // if users exists data will not be overriden
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func getFirebaseDBUserData(firebaseUser: @escaping (FirebaseUser) -> Void) {
        
        if let currentUser = FIRAuth.auth()?.currentUser {
            
            currentUserUid = currentUser.uid
            
            setCurrentUserName(name: currentUser.displayName)
            setCurrentUserEmail(email: currentUser.email)
            
            if let currentUserPhotoUrl = currentUser.photoURL {
                
                let keyForStoringInCache = "\(self.photoUrlForFirebase)\(self.currentUserUid)" as NSString

                photoUrlForFirebase = "\(currentUserPhotoUrl)"
                
                if let userImageFromCache = FeedVC.imageCache.object(forKey: keyForStoringInCache) {
                    userImage = userImageFromCache
                    firebaseUser(FirebaseUser(userUid: currentUserUid, userDisplayName: userName, userEmail: userEmail, userImage: userImage))
                } else {
                    getUserImage(fromUrl: currentUserPhotoUrl, completion: { (userImage) in
                        
                        firebaseUser(FirebaseUser(userUid: self.currentUserUid, userDisplayName: self.userName, userEmail: self.userEmail, userImage: userImage))
                        
                        self.storeUserImageInCache(userImage: userImage, forKey: keyForStoringInCache)
                    })
                }
            } else {
                userImage = UIImage(named: DEFAULT_AVATAR)
                firebaseUser(FirebaseUser(userUid: currentUserUid, userDisplayName: userName, userEmail: userEmail, userImage: userImage))
            }
        } else {
            firebaseUser(FirebaseUser())
        }
    }
    
    func getUserImage(fromUrl url: URL, completion: @escaping (_ userImage: UIImage) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if (error != nil) {
                completion(UIImage(named: DEFAULT_AVATAR)!)
            } else {
                if let imageData = data {
                    let userImage = self.convertToImage(data: imageData)
                    completion(userImage)
                }
            }
        } .resume()
    }
    
    func setCurrentUserName(name: String?) {
        if let currentUserName = name {
            userName = currentUserName
        } else {
            userName = "Not specified"
        }
    }
    
    func setCurrentUserEmail(email: String?) {
        if let currentUserEmail = email {
            userEmail = currentUserEmail
        } else {
            userEmail = "Not specified"
        }
    }
    
    func convertToImage(data: Data) -> UIImage {
        if let imageFromData = UIImage(data: data) {
            return imageFromData
        }
        return UIImage(named: DEFAULT_AVATAR)!
    }
    
    func storeUserImageInCache(userImage image: UIImage, forKey key: NSString) {
        FeedVC.imageCache.setObject(image, forKey: key)
    }
}
