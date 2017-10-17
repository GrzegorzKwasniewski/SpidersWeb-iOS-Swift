//
//  BlurView.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 17/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit

class BlurView: UIVisualEffectView {
    
    init(){
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        super.init(effect: blurEffect)
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
}
