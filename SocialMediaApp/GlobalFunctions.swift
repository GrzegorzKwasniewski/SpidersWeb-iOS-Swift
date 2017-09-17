//
//  GlobalFunctions.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 17/09/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation

func createQuestionAnsweredPopUp(withDelegate vc: UIViewController) -> AuthenticationFailedPopUp {
    let questionAnsweredPopUp = AuthenticationFailedPopUp(frame: vc.view.frame)
    
    questionAnsweredPopUp.delegate = vc as? ShowPopUp
    
    return questionAnsweredPopUp
}

func setupViewForGoodAnswer(withDelegate vc: UIViewController) -> AuthenticationFailedPopUp {
    let popUp = createQuestionAnsweredPopUp(withDelegate: vc)
    popUp.message.text = PopUpMessages.goodAnswer.rawValue
    popUp.nextQuestionButton.isHidden = false
    
    return popUp
}
