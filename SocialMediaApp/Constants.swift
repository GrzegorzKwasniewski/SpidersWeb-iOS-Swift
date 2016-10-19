//
//  Constants.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 06/09/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase

let defaultAvatarUrl = "https://firebasestorage.googleapis.com/v0/b/socialmediaapp-fcfde.appspot.com/o/default-avatars%2Fdefault-avatar.png?alt=media&token=56651f7e-5959-428e-93d7-b3059ffc77fb"

let defaultAvatarFirebaseReferance = FIRStorage.storage().reference(forURL: defaultAvatarUrl)

let SHADOW_GRAY: CGFloat = 120.0 / 255.0

let KEY_UID = "uid"
