//
//  BaseVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 25/08/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        view.layer.backgroundColor = Colors.mainBackgroundColor.cgColor
    }
    
    // remove keyboard on touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with:event)
        self.view.endEditing(true)
    }
}
