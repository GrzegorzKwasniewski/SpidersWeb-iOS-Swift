//
//  LocalNotifications.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 21/04/17.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import UserNotifications

protocol LocalNotifications {}

extension LocalNotifications where Self: UIViewController {
    
    func scheduleFeedNotification(forSpider name: String, atDate date: Date) {
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().add(setRequest(forSpider: name, withDate: date)) {(error) in
            if let error = error {
                print("\(CustomErrorMessages.Error_LocalNotifications.rawValue) \(error)")
            }
        }
    }
    
    private func setRequest(forSpider name: String, withDate date: Date) -> UNNotificationRequest {
        let request = UNNotificationRequest(identifier: "textNotification", content: setContent(forSpider: name), trigger: setTrigger(withDate: date, repeats: false))

        return request
    }
    
    private func setContent(forSpider name: String) -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = "Time to feed"
        content.subtitle = "\(name) is hungry"
        content.body = "Tap to feed"
        content.sound = UNNotificationSound.default()

        return content
    }
    
    private func setTrigger(withDate date: Date, repeats: Bool) -> UNCalendarNotificationTrigger {
        let trigger = UNCalendarNotificationTrigger(dateMatching: setDateComponents(formDate: date), repeats: repeats)
        
        return trigger
    }
    
    private func setDateComponents(formDate date: Date) -> DateComponents {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents(in: .current, from: date)
        let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
        
        return newComponents
    }
}
