//
//  PopUpView.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 19/10/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation
import UIKit

class PopUpView: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("README: I'm here")
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        showAnimate()
    }
    
    
    @IBAction func dissmisView(_ sender: AnyObject) {
        removeAnimate()
    }
    
    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                
                if (finished)
                    
                {
                    self.view.removeFromSuperview()
                }
        })
    }
}
