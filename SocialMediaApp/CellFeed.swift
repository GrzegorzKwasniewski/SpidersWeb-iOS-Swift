//
//  CellFeed.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 12/09/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase

class CellFeed: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLabel: UILabel!
    
    var post: Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(post: Post, image: UIImage? = nil) {
        self.post = post
        self.caption.text = post.caption
        self.likesLabel.text = String(post.likes)
        
        if image != nil {
            self.postImage.image = image
        } else {
            let ref = FIRStorage.storage().reference(forURL: post.imageUrl as String)
            ref.data(withMaxSize: 2 * 1024 * 1024, completion: {(data ,error) in
                if error != nil {
                    print("README: Unable to dwonload image from Firebase storage - error \(error)")
                } else {
                    print("README: Image downloaded from Firebase storage")
                    if let imageData = data {
                        if let imageFromData = UIImage(data: imageData) {
                            self.postImage.image = imageFromData
                            FeedVC.imageCache.setObject(imageFromData, forKey: post.imageUrl as NSString)
                        }
                    }
                }
            })
        }
    }
}
