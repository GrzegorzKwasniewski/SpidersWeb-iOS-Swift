//
//  RoundedView.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 17/09/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit

class RoundedView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        layer.backgroundColor = Colors.MAIN_COLOR.cgColor
        
        translatesAutoresizingMaskIntoConstraints = false

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
    }
}
