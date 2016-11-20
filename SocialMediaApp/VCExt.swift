//
//  VCExt.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 01/11/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit

extension UIViewController {

    func instantiatePopUpView() -> PopUpViewVC {
        
        let popUpView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpView") as! PopUpViewVC
        self.addChildViewController(popUpView)
        popUpView.view.frame = self.view.frame
        self.view.addSubview(popUpView.view)
        popUpView.didMove(toParentViewController: self)
        
        return popUpView
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
                if (finished) {
                    self.view.removeFromSuperview()
                }
        })
    }

}
