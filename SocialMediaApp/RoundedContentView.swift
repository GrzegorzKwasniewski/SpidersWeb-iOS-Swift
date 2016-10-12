//
//  RoundedContentView.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 12/10/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit

class RoundedContentView: UIView {
    
    @IBInspectable var borderColorRed: CGFloat = 1
    @IBInspectable var borderColorGreen: CGFloat = 1
    @IBInspectable var borderColorBlue: CGFloat = 1

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red: borderColorRed/255, green: borderColorGreen/255, blue: borderColorBlue/255, alpha: 1).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 5.0
        layer.backgroundColor = UIColor.clear.cgColor
    }

}
