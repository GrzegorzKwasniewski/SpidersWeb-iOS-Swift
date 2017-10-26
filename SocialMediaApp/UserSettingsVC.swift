//
//  UserSettingsVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 08/10/16.
//  Copyright © 2016 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase
import KRProgressHUD

class UserSettingsVC: BaseVC, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var profileImage: ProfileImage!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmail: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        FirebaseDataService.ds.getFirebaseDBUserData { (firebaseUser) in
            DispatchQueue.main.async {
                self.profileImage.image = firebaseUser.image
                self.userNameLabel.text = firebaseUser.displayName
                self.userEmail.text = firebaseUser.email
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedAvatar = info[UIImagePickerControllerEditedImage] as? UIImage {
            
            profileImage.image = selectedAvatar
            
            FirebaseDataService.ds.uploadUserImage(selectedAvatar: selectedAvatar)
            
        } else {
            print("README: Valid image was not selected")
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectAvatarAction(_ sender: AnyObject) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func resetUserPassword(_ sender: AnyObject) {
        FirebaseDataService.ds.resetUserPassword()
    }
}
