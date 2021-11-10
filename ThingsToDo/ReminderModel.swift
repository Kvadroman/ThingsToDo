//
//  ReminderModel.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 27.10.2021.
//

import UIKit

class ReminderModel {

    static var shared: ReminderModel = {
        let instance = ReminderModel()
        return instance
    }()

    public init () {}

    func addReminder(for uuid: String, for body: String, for time: Double) {
        let content = UNMutableNotificationContent()
        content.title = "ThingsToDo"
        content.sound = .default
        content.body = body
        let targetDate = Date().addingTimeInterval(time)
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([
            .year, .month, .day, .hour, .minute, .second], from: targetDate), repeats: false)
        let request = UNNotificationRequest(identifier: uuid,
                                            content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if error != nil {
                fatalError()
            }
        }
    }
}
