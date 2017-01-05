//
//  UITextFieldExt.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 05/01/17.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation

extension UITextField {
    
    func set(placeHolderString string: String, withColor color: UIColor) {
        let placeholderText = NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName:color])
        self.attributedPlaceholder = placeholderText
    }
    
}
