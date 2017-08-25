//
//  RoundedButton.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 21/08/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

//
//  RoundedButton.swift
//  QuizApp
//
//  Created by Grzegorz on 30/06/2017.
//  Copyright © 2017 Grzegorz. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    @IBInspectable var customBackgroundColor: UIColor?
    @IBInspectable var customCornerRadius: CGFloat = 0
    @IBInspectable var addBorder: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let customColor = customBackgroundColor {
            layer.backgroundColor = customColor.cgColor
        } else {
            layer.backgroundColor = Colors.MAIN_COLOR.cgColor
        }
        
        if addBorder == true {
            layer.borderColor = Colors.ACENT_COLOR.cgColor
            layer.borderWidth = 2
            imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        }
        
        dropShadow()
        
    }
    
    init(withTitle title: String, titleColor: UIColor? = nil, bgColor: UIColor? = nil) {
        super.init(frame: CGRect.zero)
        
        if let customBgColor = bgColor {
            layer.backgroundColor = customBgColor.cgColor
        } else {
            layer.backgroundColor = Colors.MAIN_COLOR.cgColor
        }
        
        if addBorder == true {
            layer.borderColor = Colors.ACENT_COLOR.cgColor
            layer.borderWidth = 2
            imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        }
        
        let fontAttributes = [
            NSFontAttributeName: UIFont(name: "Avenir-Heavy", size: 18.0)!,
            NSForegroundColorAttributeName: titleColor ?? UIColor.white
        ]
        
        let attributedString = NSAttributedString(string: title, attributes: fontAttributes)
        
        setAttributedTitle(attributedString, for: .normal)
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = Colors.SECOND_COLOR.cgColor
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowRadius = 2
        
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        if let customColor = customBackgroundColor {
            layer.backgroundColor = customColor.cgColor
        } else {
            layer.backgroundColor = Colors.MAIN_COLOR.cgColor
        }
        
        if addBorder == true {
            layer.borderColor = Colors.ACENT_COLOR.cgColor
            layer.borderWidth = 2
            imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        }
        
        dropShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if addBorder == true {
            layer.cornerRadius = 5
        } else if customCornerRadius == 0 {
            layer.cornerRadius = self.bounds.size.height / 2
        } else {
            layer.cornerRadius = customCornerRadius
        }
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        resizeButtonAnimation()
        return true
    }
}

