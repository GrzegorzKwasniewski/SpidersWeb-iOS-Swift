//
//  GlobalFunctions.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 17/09/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation

func createAuthenticationFailedPopUp(withDelegate vc: UIViewController) -> AuthenticationFailedPopUp {
    let questionAnsweredPopUp = AuthenticationFailedPopUp(frame: vc.view.frame)
    
    questionAnsweredPopUp.delegate = vc as? ShowPopUp
    
    return questionAnsweredPopUp
}

func setupViewForAuthenticationFailed(withMessage message: String, withDelegate vc: UIViewController) -> AuthenticationFailedPopUp {
    let popUp = createAuthenticationFailedPopUp(withDelegate: vc)
    popUp.message.text = message
    
    return popUp
}
