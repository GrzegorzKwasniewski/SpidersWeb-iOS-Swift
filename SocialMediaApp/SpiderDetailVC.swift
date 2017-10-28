//
//  SpiderDetailVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 06/01/17.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import FirebaseDatabase
import UserNotifications

class SpiderDetailVC: BaseVC, LocalNotifications {
    
    // MARK: Fields
    
    @IBOutlet weak var generalInfoView: UIView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var nameField: RoundedBorderTextField!
    @IBOutlet weak var commonNameField: RoundedBorderTextField!
    @IBOutlet weak var speciesField: RoundedBorderTextField!
    @IBOutlet weak var genusField: RoundedBorderTextField!
    @IBOutlet weak var countryOriginField: RoundedBorderTextField!
    @IBOutlet weak var recivedFromField: RoundedBorderTextField!
    @IBOutlet weak var spiderImage: UIImageView!
    @IBOutlet var datePicker: UIDatePicker!
    
    var spiderDatabaseReference: FIRDatabaseReference!
    
    // MARK: View State
    
    // TODO: Change to otional
    var spider: Spider!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = CacheStore.imageCache.object(forKey: spider.imageUrl as NSString) {
            spiderImage.image = image
        }
        
        nameField.text = spider.name
        
        spiderDatabaseReference = FirebaseDataService.ds.REF_SPIDERS.child(spider.spiderUid)
    }
    
    // MARK: Actions
    
    /**
 
    Function for removing spider from Firebase database
     
    */
    
    @IBAction func removeSpider(_ sender: UIButton) {
        spiderDatabaseReference.removeValue()
        self.dismiss(animated: true, completion: nil)
    }
    
    /**
     
     Function for dismissing current view controller
     
     */
    
    @IBAction func backButtonTest(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /**
     
     Function for setting feed reminder for currently viewed spider
     
     */
    
    @IBAction func setFeedReminder(_ sender: UIButton) {
        scheduleFeedNotification(forSpider: nameField.text!, atDate: datePicker.date)
    }
    
    /**
     
     Function for setting segmented controll
     
     */
    
    @IBAction func segmentedControlSelection(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0 {
            generalInfoView.isHidden = false
            detailView.isHidden = true
        }
        
        if segmentedControl.selectedSegmentIndex == 1 {
            generalInfoView.isHidden = true
            detailView.isHidden = false
        }
    }
}
