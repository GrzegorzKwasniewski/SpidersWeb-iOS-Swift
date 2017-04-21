//
//  SpiderDetailVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 06/01/17.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import UserNotifications

class SpiderDetailVC: UIViewController, LocalNotifications {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var nameField: RoundedBorderTextField!
    @IBOutlet weak var commonNameField: RoundedBorderTextField!
    @IBOutlet weak var speciesField: RoundedBorderTextField!
    @IBOutlet weak var genusField: RoundedBorderTextField!
    @IBOutlet weak var countryOriginField: RoundedBorderTextField!
    @IBOutlet weak var recivedFromField: RoundedBorderTextField!
    @IBOutlet weak var spiderImage: UIImageView!
    @IBOutlet var datePicker: UIDatePicker!
    
    // TODO: Change to otional
    var spider: Spider!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = FeedVC.imageCache.object(forKey: spider.imageUrl as NSString) {
            spiderImage.image = image
        }
        
        nameField.text = spider.name
    }
    
    @IBAction func backButtonTest(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func setFeedReminder(_ sender: UIButton) {
        scheduleFeedNotification(forSpider: nameField.text!, atDate: datePicker.date)
    }
}
