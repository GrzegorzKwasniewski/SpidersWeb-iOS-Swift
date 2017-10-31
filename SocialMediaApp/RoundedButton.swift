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
    
    convenience init(withTitle title: String) {
        self.init(frame: CGRect.zero)
        
        let fontAttributes = [
            NSFontAttributeName: UIFont(name: Fonts.avenirHeavy, size: 18.0)!
        ]
        
        let attributedString = NSAttributedString(string: title, attributes: fontAttributes)
        
        setAttributedTitle(attributedString, for: .normal)
        
        setTitleColor(Colors.GREY_TEXT_COLOR, for: .normal)
        
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        layer.backgroundColor = Colors.MAIN_COLOR.cgColor
        
        imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
        translatesAutoresizingMaskIntoConstraints = false

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 5

    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        resizeButtonAnimation()
        return true
    }
}

