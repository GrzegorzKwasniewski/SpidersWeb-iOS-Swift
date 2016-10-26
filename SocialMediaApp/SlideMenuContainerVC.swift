//
//  SlideMenuContainerVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 25/10/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class SlideMenuContainerVC: SlideMenuController {
    
    
    override func awakeFromNib() {
        slideMenuController()?.changeLeftViewWidth(100)
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "Main") {
            self.mainViewController = controller
        }
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "Left") {
            self.leftViewController = controller
        }
        super.awakeFromNib()
    }
    
}
