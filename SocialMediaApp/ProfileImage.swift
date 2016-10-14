//
//  ProfileImage.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 09/10/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit

class ProfileImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
//        var radius = min(self.bounds.width, self.bounds.height)
//        var drawingRect : CGRect = self.bounds
//        drawingRect.size.width = radius
//        drawingRect.origin.x = (self.bounds.size.width - radius) / 2
//        drawingRect.size.height = radius
//        drawingRect.origin.y = (self.bounds.size.height - radius) / 2
//        
//        radius /= 2
//        
//        var path = UIBezierPath(roundedRect: drawingRect.insetBy(dx: 8 / 2, dy: 8 / 2), cornerRadius: radius)
//        let border = CAShapeLayer()
//        border.fillColor = UIColor.clear.cgColor
//        border.path = path.cgPath
//        border.strokeColor = UIColor(red: 0.5, green: 0.7, blue: 0.5, alpha: 1).cgColor
//        border.lineWidth = 8
//        self.layer.addSublayer(border)
//        
//        path = UIBezierPath(roundedRect: drawingRect, cornerRadius: radius)
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        self.layer.mask = mask
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }

}
