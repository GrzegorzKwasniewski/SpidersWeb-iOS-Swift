//
//  LeftSlideMenuVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 25/10/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class LeftSlideMenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func goToUserSettings(_ sender: AnyObject) {
        if let slideMenuController = self.slideMenuController() {
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "userSettings") {
                let mainViewController = controller
                slideMenuController.changeMainViewController(mainViewController, close: true)
            }

        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
