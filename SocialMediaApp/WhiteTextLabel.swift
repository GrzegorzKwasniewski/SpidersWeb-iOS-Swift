//
//  WhiteTextLabel.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 17/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit

class WhiteTextLabel: UILabel {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        textColor = .white
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.5
        
        backgroundColor = UIColor.clear
        layer.masksToBounds = false
        
        font = UIFont(name: "Avenir-Heavy", size: 18.0)
        textAlignment = .center
        numberOfLines = 2
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
}
