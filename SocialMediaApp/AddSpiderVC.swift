//
//  AddSpiderVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 04/01/17.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase

class AddSpiderVC: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var nameField: RoundedBorderTextField!
    @IBOutlet weak var commonNameField: RoundedBorderTextField!
    @IBOutlet weak var speciesField: RoundedBorderTextField!
    @IBOutlet weak var genusField: RoundedBorderTextField!
    @IBOutlet weak var countryOriginField: RoundedBorderTextField!
    @IBOutlet weak var recivedFromField: RoundedBorderTextField!
    @IBOutlet weak var spiderImage: UIImageView!
    
    var currentUserUid = String()
    var imagePicker = UIImagePickerController()
    var imageSelected = false
    var testData = ["Female", "Male", "Unknown"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkForSignInUser()
        setDelegates()
        
        nameField.set(placeHolderString: "name", withColor: UIColor.white)
    }
    
    func setDelegates() {
        
        pickerView.delegate = self
        pickerView.dataSource = self
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    @IBAction func addSpiderPhoto() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addSpiderToFirebase() {
        postToFirebase()
    }
    
    @IBAction func backButtonTesting() {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: Handle Firebase
extension AddSpiderVC {
    
    func checkForSignInUser() {
        if let currentFirebaseUser = FIRAuth.auth()?.currentUser {
            currentUserUid = currentFirebaseUser.uid
        }
    }

    func postToFirebase() {
        
        // TODO: Add progress custom sprogress bar when adding spider
        let post: Dictionary<String, AnyObject> = [
            
            "userUid": currentUserUid as NSString,
            "name": nameField.text! as NSString,
            "commonName": commonNameField.text! as NSString,
            "species": speciesField.text! as NSString,
            "genus": genusField.text! as NSString,
            "countryOrigin": countryOriginField.text! as NSString,
            "recivedFrom": recivedFromField.text! as NSString
            
            //"imageUrl": imageUrl as NSString,

        ]
        
        let firebaseSpider = DataService.ds.REF_SPIDERS.childByAutoId()
        firebaseSpider.setValue(post) { (error, firDatabaseReference) in
            
            if error != nil {
                print("README: Could not save spider to Firebase")
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}

extension AddSpiderVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            spiderImage.image = image
            imageSelected = true
        } else {
            print("Valid image was not selected")
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }

}

extension AddSpiderVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return testData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return testData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}
