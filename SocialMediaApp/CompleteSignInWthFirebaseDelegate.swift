//
//  FirebaseLoginDelegate.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 03/11/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

protocol CompleteSignInWthFirebaseDelegate: class {
    
    func completeSignIn(id: String, userData: Dictionary<String, String>)
    
}
