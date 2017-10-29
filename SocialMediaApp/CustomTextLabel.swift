//
//  CustomTextLabel.swift
//  SocialMediaApp
//
//  Created by serwis on 29/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation

class CustomTextLabel: UILabel {
    
    convenience init(withMessage message: String, textColor color: UIColor) {
        self.init(frame: CGRect.zero)
        
        text = message
        textColor = color
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textAlignment = .center
        backgroundColor = .clear
        numberOfLines = 2
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.5
        font = UIFont(name: Fonts.avenirHeavy, size: 18.0)
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
