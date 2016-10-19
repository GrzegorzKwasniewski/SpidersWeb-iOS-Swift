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
    @IBOutlet var likeImage: CircleView!
    @IBOutlet weak var likesLabel: UILabel!
    
    var post: Post!
    var likesRef: FIRDatabaseReference!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        tap.numberOfTapsRequired = 1
        likeImage.addGestureRecognizer(tap)
        likeImage.isUserInteractionEnabled = true
        
    }
    
    func configureCell(post: Post, image: UIImage? = nil) {
        self.post = post
        likesRef = DataService.ds.REF_USER_CURRENT.child("likes").child(post.postID)
        self.caption.text = post.caption
        self.likesLabel.text = String(post.likes)
        
        DataService.ds.REF_USERS.observe(.value, with: {(snapshot) in
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    if let snapDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key // in this case it's user UID
                        if key == post.userUid {
                            let userName = snapDictionary["userName"] as! String
                            var photoData: NSData!
                            let userPhotoUrl: URL!
                            
                            if let photoUrl = snapDictionary["photoUrl"] {
                                userPhotoUrl = URL(string: String(describing: photoUrl))
                                photoData = NSData(contentsOf: userPhotoUrl)
                                let userImage = UIImage(data: photoData as Data)
                                self.userImage.image = userImage
                            } else {
                                self.userImage.image = UIImage(named: "profile-picture")
                            }

                            self.userNameLabel.text = userName
                        }
                    }
                }
            }
        })
        
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
        
        likesRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if let _ = snapshot.value as? NSNull {
                self.likeImage.image = UIImage(named: "like-button-no")
            } else {
                self.likeImage.image = UIImage(named: "like-button-yes")
            }
        })
    }
    
    func likeTapped(sender: UITapGestureRecognizer) {
        likesRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if let _ = snapshot.value as? NSNull {
                self.likeImage.image = UIImage(named: "like-button-yes")
                self.post.adjustLikes(addLike: true)
                self.likesRef.setValue(true)
            } else {
                self.likeImage.image = UIImage(named: "like-button-no")
                self.post.adjustLikes(addLike: false)
                self.likesRef.removeValue()
            }
        })
    }
    
    
}
