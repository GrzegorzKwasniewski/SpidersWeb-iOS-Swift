//
//  File.swift
//  SocialMediaApp
//
//  Created by serwis on 05/11/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation

final class CustomStackView: UIStackView {

    override init(frame: CGRect){
        super.init(frame: frame)
        axis = .horizontal
        distribution = .fillEqually
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
