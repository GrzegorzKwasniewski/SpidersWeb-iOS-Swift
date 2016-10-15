//
//  FeedVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 10/09/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper
import KRProgressHUD

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var posts = [Post]()
    var imagePicker = UIImagePickerController()
    static var imageCache: NSCache<NSString, UIImage> = NSCache()
    var imageSelected = false
        
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var selectImageButton: UIImageView!
    @IBOutlet weak var captionLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // we set observer to listen for changes on POSTS end point
        DataService.ds.REF_POSTS.observe(.value, with: {(snapshot) in
            self.posts = []
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    print("SNAP: \(snap)")
                    if let snapDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key // it default property from Firebase
                        let post = Post(postID: key, postData: snapDictionary)
                        self.posts.append(post)
                    }
                }
            }
            self.tableView.reloadData()
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CellFeed") as? CellFeed {
            
            if let image = FeedVC.imageCache.object(forKey: post.imageUrl as NSString) {
                cell.configureCell(post: post, image: image)
                return cell
            } else {
                cell.configureCell(post: post)
                return cell
            }
        } else {
            return CellFeed()
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            selectImageButton.image = image
            imageSelected = true
        } else {
            print("Valid image was not selected")
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func postToFirebase(imageUrl: String) {
        let post: Dictionary<String, AnyObject> = [
            // Caption is valideted when sending post - but not secure
            "caption": captionLabel.text! as NSString,
            "imageUrl": imageUrl as NSString,
            "likes": 0 as NSNumber
        ]
        
        // referance for POSTS end point
        let firebasePost = DataService.ds.REF_POSTS.childByAutoId() // generate uniqe ID
        firebasePost.setValue(post)
        
        captionLabel.text = ""
        imageSelected = false
        selectImageButton.image = UIImage(named: "add-image")
        
        tableView.reloadData()
    }

    @IBAction func addPostAction(_ sender: AnyObject) {
        guard let caption = captionLabel.text, caption != "" else {
            print("README: You need to enter caption")
            return
        }
        
        guard let image = selectImageButton.image, imageSelected == true else {
            print("README: You must selcet an image")
            return
        }
        
        if let imageData = UIImageJPEGRepresentation(image, 0.2) {
            let imageUid = NSUUID().uuidString
            // it' good to tell Firebase what data we want to store
            let metaData = FIRStorageMetadata()
            metaData.contentType = "image/jpeg"
            
            DataService.ds.REF_POST_IMAGES.child(imageUid).put(imageData, metadata: metaData, completion: { (metadata, error) in
                if error != nil {
                    print("REDAME: There was an error when uploading image to Firebase")
                } else {
                    // give response to the user
                    print("README: Imge sucessfully uploaded to Firebase storage")
                    let downloadUrl = metadata?.downloadURL()?.absoluteString
                    if let url = downloadUrl {
                        self.postToFirebase(imageUrl: url)
                    }
                }
            })
        }
    }
    
    
    @IBAction func addPhotoAction(_ sender: AnyObject) {
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func goToUserSettings(_ sender: AnyObject) {
        performSegue(withIdentifier: "userSettings", sender: nil)
    }
    
    @IBAction func forTestsOnlyAction(_ sender: AnyObject) {
        let keychainResult = KeychainWrapper.removeObjectForKey(KEY_UID)
        print("KEYCHAIN: Keychain was removed - \(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        self.dismiss(animated: true, completion: nil)
    }
}
