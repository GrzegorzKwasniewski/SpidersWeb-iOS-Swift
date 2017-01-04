//
//  ShadowButton.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 06/09/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit

class ShadowButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.opacity = 1.0
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
        layer.cornerRadius = 30.0
    }

}
