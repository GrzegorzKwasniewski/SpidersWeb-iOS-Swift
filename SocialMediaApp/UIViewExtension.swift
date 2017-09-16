//
//  UIViewExtension.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 21/08/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit

extension UIView {
    
    func resizeButtonAnimation() {
        let resize = CABasicAnimation(keyPath: "transform")
        resize.fromValue = CATransform3DMakeScale(1.1, 1.15, 1.1)
        resize.toValue = CATransform3DMakeScale(1.0, 1.0, 1.0)
        resize.duration = 0.3
        resize.fillMode = kCAFillModeBoth
        
        layer.add(resize, forKey: nil)
        layer.transform = CATransform3DMakeScale(1, 1, 1)
    }
    
    func resizeAnimation() {
        let resize = CABasicAnimation(keyPath: "transform")
        resize.fromValue = CATransform3DMakeScale(0.0, 0.0, 0.0)
        resize.toValue = CATransform3DMakeScale(1.0, 1.0, 1.0)
        resize.duration = 0.1
        resize.fillMode = kCAFillModeBoth
        
        layer.add(resize, forKey: nil)
        layer.transform = CATransform3DMakeScale(1, 1, 1)
    }
    
    func horizontalAnimation(delayedBy: Double = 0.0) {
        
        guard let superview = superview else { return }
        
        let horizontalAnimation = CASpringAnimation(keyPath: "position.x")
        horizontalAnimation.damping = 14
        horizontalAnimation.initialVelocity = 5
        horizontalAnimation.fromValue = -superview.bounds.size.width / 2
        horizontalAnimation.toValue = superview.bounds.size.width / 2
        horizontalAnimation.duration = horizontalAnimation.settlingDuration // time to settle down by animation
        horizontalAnimation.fillMode = kCAFillModeBoth
        horizontalAnimation.beginTime = CACurrentMediaTime() + delayedBy
        
        layer.add(horizontalAnimation, forKey: nil)
        
        layer.position.x = superview.bounds.size.width / 2
    }
    
    func verticalAnimation(delayedBy: Double = 0.0, onView: UIView) {
        
        //guard let superview = superview else { return }
        
        let verticalAnimation = CABasicAnimation(keyPath: "position.y")
        verticalAnimation.fromValue = onView.bounds.size.height * 1.5
        verticalAnimation.toValue = layer.position.y
        verticalAnimation.duration = 0.4
        verticalAnimation.fillMode = kCAFillModeBoth
        verticalAnimation.beginTime = CACurrentMediaTime() + delayedBy
        verticalAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        layer.add(verticalAnimation, forKey: nil)
        
        layer.position.y = layer.position.y
    }
    
    func tintBackgroundColorAnimation(toColor: UIColor) {
        
        let tint = CABasicAnimation(keyPath: "backgroundColor")
        tint.fromValue = layer.backgroundColor
        tint.toValue = toColor.cgColor
        tint.duration = 0.1
        tint.fillMode = kCAFillModeBoth
        
        layer.add(tint, forKey: nil)
        
        layer.backgroundColor = toColor.cgColor
    }
    
    func roundCornersAnimation(toRadius: CGFloat) {
        
        let round = CABasicAnimation(keyPath: "cornerRadius")
        round.fromValue = layer.cornerRadius
        round.toValue = toRadius
        round.duration = 0.33
        layer.add(round, forKey: nil)
        layer.cornerRadius = toRadius
    }
    
    func opacityAnimation(reverse: Bool, withDuration: Double = 0.3) {
        let opacity = CABasicAnimation(keyPath: "opacity")
        
        if reverse {
            opacity.fromValue = layer.opacity
            opacity.toValue = 0
        } else {
            opacity.fromValue = 0
            opacity.toValue = layer.opacity
        }
        
        opacity.duration = withDuration
        opacity.fillMode = kCAFillModeBoth
        
        layer.add(opacity, forKey: nil)
        
        if reverse {
            layer.opacity = 0
        } else {
            layer.opacity = layer.opacity
        }
    }
    
    func borderAnimatioTest(layer: CALayer) {
        
        layer.borderColor = Colors.MAIN_COLOR_LIGHTER.cgColor
        
        let resize = CABasicAnimation(keyPath: "borderWidth")
        resize.fromValue = 0
        resize.toValue = 3
        resize.duration = 1
        resize.fillMode = kCAFillModeBoth
        
        layer.add(resize, forKey: nil)
        
        layer.borderWidth = 4
    }
    
    func dropShadow() {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = Colors.GREY_SHADOW_COLOR.cgColor
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowRadius = 2
        
    }
}

