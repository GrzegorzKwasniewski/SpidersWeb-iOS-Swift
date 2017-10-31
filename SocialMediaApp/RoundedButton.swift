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
    
    var customBackgroundColor: UIColor?
    var customCornerRadius: CGFloat = 0
    var addBorder: Bool = false
    
    init(frame: CGRect, withTitle title: String) {
        super.init(frame: frame)
        
        layer.backgroundColor = UIColor.white.cgColor
        
        layer.borderColor = Colors.GREY_TEXT_COLOR.cgColor
        layer.borderWidth = 2
        
        let fontAttributes = [
            NSFontAttributeName: UIFont(name: "Avenir-Heavy", size: 18.0)!,
            NSForegroundColorAttributeName: Colors.GREY_TEXT_COLOR
        ]
        
        let attributedString = NSAttributedString(string: title, attributes: fontAttributes)
        
        setAttributedTitle(attributedString, for: .normal)
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    init(withTitle title: String, titleColor: UIColor? = nil, bgColor: UIColor? = nil) {
        super.init(frame: CGRect.zero)
        
        if let customBgColor = bgColor {
            layer.backgroundColor = customBgColor.cgColor
        } else {
            layer.backgroundColor = UIColor.white.cgColor
        }
        
        layer.borderColor = Colors.GREY_TEXT_COLOR.cgColor
        layer.borderWidth = 2
        
        let fontAttributes = [
            NSFontAttributeName: UIFont(name: "Avenir-Heavy", size: 18.0)!,
            NSForegroundColorAttributeName: Colors.GREY_TEXT_COLOR
        ]
        
        let attributedString = NSAttributedString(string: title, attributes: fontAttributes)
        
        setAttributedTitle(attributedString, for: .normal)
        
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        layer.backgroundColor = Colors.MAIN_COLOR.cgColor
        
        imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

