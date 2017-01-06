//
//  AddSpiderVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 04/01/17.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit

class AddSpiderVC: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var nameField: RoundedBorderTextField!
    @IBOutlet weak var commonNameField: RoundedBorderTextField!
    @IBOutlet weak var speciesField: RoundedBorderTextField!
    @IBOutlet weak var genusField: RoundedBorderTextField!
    @IBOutlet weak var countryOriginField: RoundedBorderTextField!
    @IBOutlet weak var recivedFromField: RoundedBorderTextField!
    
    var testData = ["Female", "Male", "Unknown"]

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        nameField.set(placeHolderString: "name", withColor: UIColor.white)
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
    
    func postToFirebase() {
        
        let post: Dictionary<String, AnyObject> = [
            
            "name": nameField.text! as NSString,
            "commonName": commonNameField.text! as NSString,
            "species": speciesField.text! as NSString,
            "genus": genusField.text! as NSString,
            "countryOrigin": countryOriginField.text! as NSString,
            "recivedFrom": recivedFromField.text! as NSString
            
            //"userUid": currentUserUid as NSString
            //"imageUrl": imageUrl as NSString,

        ]
        
        // referance for SPIDERS end point
        let firebaseSpider = DataService.ds.REF_SPIDERS.childByAutoId() // generate uniqe ID
        firebaseSpider.setValue(post)
        
        // assign post to current user
        //        let currentUserPosts = DataService.ds.REF_USER_CURRENT.child("posts")
        //        currentUserPosts.updateChildValues([firebasePost.key: true])
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
