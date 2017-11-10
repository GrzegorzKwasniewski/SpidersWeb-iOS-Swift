//
//  FirebaseLoginDelegate.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 03/11/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

protocol CompleteSignInWithFirebaseDelegate: class {
    
    /**
     After successful login call this method on delegate for completing sign in to Firebase
     
     - Parameter id: user id
     - Parameter id: data that will be assigned to the user
     */
    
    func completeSignIn(userID id: String, userData data: [String: String])
    
}
