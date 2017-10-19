//
//  GlobalFunctions.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 17/09/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation

func setupViewForAuthenticationFailed(withMessage message: String, forVC vc: UIViewController) -> AuthenticationFailedPopUp {
    
    let popUp = AuthenticationFailedPopUp(frame: vc.view.frame)
    popUp.message.text = message
    
    return popUp
}
