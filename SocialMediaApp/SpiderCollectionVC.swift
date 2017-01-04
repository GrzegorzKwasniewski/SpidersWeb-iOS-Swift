//
//  SpiderCollectionVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 04/01/17.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit

class SpiderCollectionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func goToUserSettings(_ sender: AnyObject) {
        if let slideMenuController = self.slideMenuController() {
            slideMenuController.openLeft()
        } else {
            print("README: There's no slideMenuController - check if You have container ViewController for slide menu")
        }
    }
}
