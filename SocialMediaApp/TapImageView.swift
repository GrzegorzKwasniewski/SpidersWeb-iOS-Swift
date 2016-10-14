//
//  TapImageView.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 11/10/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit

class TapImageView: UIImageView {
    
    @IBInspectable var functionName: String = "userSettings"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(userSettings))
        tap.numberOfTapsRequired = 1
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
    }
    
    func userSettings(sender: UITapGestureRecognizer) {
        print("README: TAP")
    }

}
