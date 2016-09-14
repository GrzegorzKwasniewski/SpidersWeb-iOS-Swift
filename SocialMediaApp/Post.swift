//
//  Post.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 14/09/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation

class Post {
    
    private var _caption: String!
    private var _imageUrl: String!
    private var _likes: Int!
    private var _postID: String!
    
    var caption: String {
        return _caption
    }
    
    var imageUrl: String {
        return _imageUrl
    }
    
    var likes : Int {
        return _likes
    }
    
    var postID: String {
        return _postID
    }
    
    init(caption: String, imageUrl: String, likes: Int) {
        _caption = caption
        _imageUrl = imageUrl
        _likes = likes
    }
    
    init(postID: String, postData: Dictionary<String, AnyObject>) {
        _postID = postID
        
        if let caption = postData["caption"] as? String{
            _caption = caption
        }
        
        if let imageUrl = postData["imageUrl"] as? String{
            _imageUrl = imageUrl
        }
        
        if let likes = postData["likes"] as? Int {
            _likes = likes
        }
    }
}
