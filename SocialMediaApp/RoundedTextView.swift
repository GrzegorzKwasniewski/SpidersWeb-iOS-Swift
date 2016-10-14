//
//  RoundedTextView.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 12/10/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit

class RoundedTextView: UITextView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red: 126/255, green: 211/255, blue: 33/255, alpha: 1).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 5.0
        layer.backgroundColor = UIColor.clear.cgColor
    }

}
