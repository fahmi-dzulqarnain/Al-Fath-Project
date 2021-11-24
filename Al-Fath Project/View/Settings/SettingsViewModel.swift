//
//  SettingsViewModel.swift
//  Al-Fath Project
//
//  Created by Muhammad Firdaus on 24/11/21.
//

import Foundation
import UserNotifications

class SettingsViewModel : ObservableObject {
    
    init() {
        isNotifyPractice = UserDefaults.standard.isNotifyPractice()
    }
    
    @Published var isNotifyPractice: Bool {
        didSet {
            UserDefaults.standard.setNotifyPractice(value: isNotifyPractice)
            if isNotifyPractice {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
                showNotification()
            } else {
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            }
        }
    }
    
    func showNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Yuk bisa yuk bisa"
        content.subtitle = "Jangan lupa latihan"
        content.sound = UNNotificationSound.default
        var date = DateComponents()
        date.hour = 8
        date.minute = 30
        
        // show this notification
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: "Latihan", content: content, trigger: trigger)

        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
}
