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
    
    @IBOutlet weak var spiderImage: UIImageView!
    @IBOutlet weak var spiderName: UILabel!
    
    var spider: Spider!
    
    func configureCell(spider: Spider, image: UIImage? = nil) {

        self.spider = spider
        self.spiderName.text = spider.name
        
        // SPIDER image
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
                            UIView.animate(withDuration: 0.2, animations: {
                                self.spiderImage.alpha = 1.0
                            })
                            FeedVC.imageCache.setObject(imageFromData, forKey: spider.imageUrl as NSString)
                        }
                    }
                }
            })
        }
    }
}