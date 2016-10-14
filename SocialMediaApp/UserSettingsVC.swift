//
//  UserSettingsVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 08/10/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase

class UserSettingsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    
    
    @IBOutlet var profileImage: ProfileImage!
    @IBOutlet var userNameLabel: UILabel!
    
    @IBAction func changeUserName(_ sender: AnyObject) {
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            if let currentUser = user {
                let changeRequest = currentUser.profileChangeRequest()
                changeRequest.displayName = "Jane Q. User"
                //changeRequest.photoURL = NSURL(string: "https://example.com/jane-q-user/profile.jpg")
                changeRequest.commitChanges { error in
                    if let error = error {
                        print("README: Error while trying to change user data")
                    } else {
                        // Profile updated.
                    }
                }
            } else {
                print("REDAME: There's no user signed in")
            }
        }
    }
    
    @IBAction func BackButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            if let currentUser = user {
                // TO SET LATER let currentUserEmail = currentUser.email
                let currentUserUid = currentUser.uid
                guard let currentUserName = currentUser.displayName, let currentUserPhotoUrl = currentUser.photoURL else { print("README: Can't get user data from Firebase")
                    return
                }
                
                let photoUrlForFirebase = "\(currentUserPhotoUrl)"
                
                if let userImageFromCache = FeedVC.imageCache.object(forKey: photoUrlForFirebase as NSString) {
                    self.profileImage.image = userImageFromCache
                } else {
                    let ref = FIRStorage.storage().reference(forURL: photoUrlForFirebase)
                    ref.data(withMaxSize: 2 * 1024 * 1024, completion: {(data ,error) in
                        if error != nil {
                            print("README: Unable to dwonload image from Firebase storage - error \(error)")
                        } else {
                            print("README: Image downloaded from Firebase storage")
                            if let imageData = data {
                                if let imageFromData = UIImage(data: imageData) {
                                    self.profileImage.image = imageFromData
                                    FeedVC.imageCache.setObject(imageFromData, forKey: photoUrlForFirebase as NSString)
                                }
                            }
                        }
                    })
                }
                self.userNameLabel.text = currentUserName
            } else {
                print("REDAME: There's no user signed in")
            }
        }
    }
    
    @IBAction func selectAvatarAction(_ sender: AnyObject) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedAvatar = info[UIImagePickerControllerEditedImage] as? UIImage {
            profileImage.image = selectedAvatar
            
            if let imageData = UIImageJPEGRepresentation(selectedAvatar, 0.2) {
                let imageUid = NSUUID().uuidString
                // it' good to tell Firebase what data we want to store
                let metaData = FIRStorageMetadata()
                metaData.contentType = "image/jpeg"
                
                DataService.ds.REF_USERS_AVATARS.child(imageUid).put(imageData, metadata: metaData, completion: { (metadata, error) in
                    if error != nil {
                        print("REDAME: There was an error when uploading image to Firebase")
                    } else {
                        // give response to the user
                        print("README: Imge sucessfully uploaded to Firebase storage")
                        let downloadUrl = metadata?.downloadURL()?.absoluteString
                        if let url = downloadUrl {
                            self.assignAvatarToFirebaseUser(imageUrl: url)
                        }
                    }
                })
            }
        } else {
            print("README: Valid image was not selected")
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func assignAvatarToFirebaseUser(imageUrl: String) {
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            if let currentUser = user {
                let changeRequest = currentUser.profileChangeRequest()
                changeRequest.photoURL = URL(string: imageUrl)
                changeRequest.commitChanges { error in
                    if let error = error {
                        print("README: Error while trying to change user data")
                    } else {
                        // Profile updated.
                    }
                }
            } else {
                print("REDAME: There's no user signed in")
            }
        }
    }
}
