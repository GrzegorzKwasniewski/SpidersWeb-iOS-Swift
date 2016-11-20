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

class UserSettingsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var popUpView = PopUpViewVC()
    var imagePicker = UIImagePickerController()
    
    
    @IBOutlet weak var profileImage: ProfileImage!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmail: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpView = instantiatePopUpView()

        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        DataService.ds.getFirebaseDBUserData { (firebaseUser, succes) in
            if succes {
                DispatchQueue.main.async {
                    self.profileImage.image = firebaseUser.image
                    self.userNameLabel.text = firebaseUser.display_name
                    self.userEmail.text = firebaseUser.email
                    self.popUpView.removeAnimate()
                }
            } else {
                DispatchQueue.main.async {
                    self.profileImage.image = firebaseUser.image
                    self.userNameLabel.text = firebaseUser.display_name
                    self.userEmail.text = firebaseUser.email
                    self.popUpView.removeAnimate()
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
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
                print("README: There's no user signed in")
            }
        }
    }
    
    @IBAction func BackButton(_ sender: AnyObject) {
        if let slideMenuController = self.slideMenuController() {
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "Main") {
                let mainViewController = controller
                slideMenuController.changeMainViewController(mainViewController, close: true)
            }
        }  else {
            print("README: There's no slideMenuController - check if You have container ViewController for slide menu")
        }
    }
    
    @IBAction func selectAvatarAction(_ sender: AnyObject) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func changeUserData(_ sender: AnyObject) {
            let popUpView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "changeUserName") as! ChangeUserNamePopUpVC
            self.addChildViewController(popUpView)
            popUpView.view.frame = self.view.frame
            self.view.addSubview(popUpView.view)
            popUpView.didMove(toParentViewController: self)
    }
    
    @IBAction func reAuth(_ sender: AnyObject) {
        let popUpView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "reAuthenticateUser") as! ReAuthenticateUserVC
        self.addChildViewController(popUpView)
        popUpView.view.frame = self.view.frame
        self.view.addSubview(popUpView.view)
        popUpView.didMove(toParentViewController: self)
    }
    
    @IBAction func changeUserEmail(_ sender: AnyObject) {
        let popUpView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "changeUserEmail") as! ChangeUserEmailVC
        self.addChildViewController(popUpView)
        popUpView.view.frame = self.view.frame
        self.view.addSubview(popUpView.view)
        popUpView.didMove(toParentViewController: self)
    }
    
    @IBAction func resetUserPassword(_ sender: AnyObject) {
        if let user = FIRAuth.auth()?.currentUser {
            if let email = user.email {
                FIRAuth.auth()?.sendPasswordReset(withEmail: email) { error in
                    if let error = error {
                        print("README: Can't send reset email")
                    } else {
                        print("README: Reset email was sent")
                    }
                }
            }
        }
    }
}
