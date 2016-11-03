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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.view.layer.borderColor = UIColor.white.cgColor
        self.view.layer.borderWidth = 1.0
        self.view.layer.cornerRadius = 5.0

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        //showAnimate()
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
