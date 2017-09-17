//
//  RoundedView.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 17/09/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit

class RoundedView: UIView {
    
    var customBackgroundColor: UIColor?
    var customCornerRadius: CGFloat = 5
    var customBorderRadius: CGFloat = 0
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        if let customColor = customBackgroundColor {
            layer.backgroundColor = customColor.cgColor
        } else {
            layer.backgroundColor = Colors.MAIN_COLOR.cgColor
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = customCornerRadius
    }
}
