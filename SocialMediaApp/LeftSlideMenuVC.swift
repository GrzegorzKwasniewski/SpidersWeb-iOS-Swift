//
//  LeftSlideMenuVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 25/10/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import KRProgressHUD
import SlideMenuControllerSwift

class LeftSlideMenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToUserSettings(_ sender: AnyObject) {
        if let slideMenuController = self.slideMenuController() {
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "userSettings") {
                let mainViewController = controller
                slideMenuController.changeMainViewController(mainViewController, close: true)
            }
        }  else {
            print("README: There's no slideMenuController - check if You have container ViewController for slide menu")
        }
    }
}
