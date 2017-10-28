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
    
    private var spider: Spider = Spider(spiderId: "", spiderData: [:])
    
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
    ///     - Parameter image: parameter containing spider image
    
    func configureCell(spider: Spider, image: UIImage = #imageLiteral(resourceName: "purple-cartoon-spider")) {

        self.spider = spider
        self.spiderName.text = spider.name
        self.spiderImage.image = image
        
        UIView.animate(withDuration: 1.0, animations: {
            self.spiderImage.alpha = 1.0
        })
        
        SignInVC.imageCache.setObject(image, forKey: spider.imageUrl as NSString)
    }
}
