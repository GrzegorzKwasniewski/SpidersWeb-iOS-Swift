//
//  ShowPopUp.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 17/09/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit

protocol ShowPopUp: class {
    
    func showPopUp(withMainMessage message: String, andErrorMessage error: String?)
    func showSummaryPopUp(quizCompleted: Bool)
    
    func authenticationFailed(withMessage message: String?)
    func authenticationSuccess()
    func hidePopUp()
    func dismissSuperView()
    
}

extension ShowPopUp where Self: UIViewController {
    
    // default implementation
    func showPopUp() {}
    func showPopUp(withMainMessage message: String, andErrorMessage error: String? = "") {}
    
    func showSummaryPopUp(quizCompleted: Bool) {}
    
    func authenticationFailed(withMessage message: String? = "") {}
    func authenticationSuccess() {}
    func hidePopUp() {}
    func dismissSuperView() {}
    
}
