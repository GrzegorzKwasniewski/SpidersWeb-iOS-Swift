//
//  CellSpider.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 06/01/17.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase

class CellSpider: UICollectionViewCell {
    
    // MARK: Fields
    
    @IBOutlet weak var spiderImage: UIImageView!
    @IBOutlet weak var spiderName: UILabel!
    
    private var spider: Spider!
    
    // MARK: View State
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        spiderImage.alpha = 0.0
        spiderName.alpha = 1.0
        
        layer.borderColor = Colors.GREY_TEXT_COLOR.cgColor
        layer.borderWidth = 2
        
        layer.cornerRadius = 5.0
        
    }
    
    // MARK: Custom Functions
    
    /// Function for configuring spider cell
    ///     - Parameter spider: spider object that will provide data for configuration
    ///     - Parameter image: optional parameter containing spider image
    
    func configureCell(spider: Spider, image: UIImage? = nil) {

        self.spider = spider
        self.spiderName.text = spider.name
        
        // spider image
        if image != nil {
            self.spiderImage.image = image
            UIView.animate(withDuration: 0.2, animations: {
                self.spiderImage.alpha = 1.0
            })
        } else {
            let ref = FIRStorage.storage().reference(forURL: spider.imageUrl as String)
            ref.data(withMaxSize: 2 * 1024 * 1024, completion: {(data ,error) in
                if error != nil {
                    print("README: Unable to dwonload image from Firebase storage - error \(error)")
                } else {
                    print("README: Image downloaded from Firebase storage")
                    if let imageData = data {
                        if let imageFromData = UIImage(data: imageData) {
                            self.spiderImage.image = imageFromData
                            UIView.animate(withDuration: 2.0, animations: {
                                self.spiderImage.alpha = 1.0
                            })
                            SignInVC.imageCache.setObject(imageFromData, forKey: spider.imageUrl as NSString)
                        }
                    }
                }
            })
        }
    }
}
