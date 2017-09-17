//
//  ClearTextField.swift
//  QuizApp
//
//  Created by Grzegorz on 30/06/2017.
//  Copyright © 2017 Grzegorz. All rights reserved.
//

import UIKit

class ClearTextField: UITextField {
    
    @IBInspectable var customString: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        
        textColor = Colors.GREY_TEXT_COLOR
        
        backgroundColor = UIColor.clear
        borderStyle = .none
        layer.masksToBounds = false

        self.attributedPlaceholder = NSAttributedString(string: customString, attributes: [NSForegroundColorAttributeName: Colors.GREY_TEXT_COLOR_LIGHT])

    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }

}
