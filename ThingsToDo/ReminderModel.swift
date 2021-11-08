//
//  ReminderModel.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 27.10.2021.
//

import UIKit

class ReminderModel {

    private var identifiers: [String] = []
    public var id: String = ""
    public var time: Double = 0
    private var tasks: [Tasks] = []
//    static var shared: ReminderModel = {
//        let instance = ReminderModel(time: Double)
//        return instance
//    }()

    public init () {
        id = UUID().uuidString
    }

    public convenience init (time: Double) {
        self.init()
        self.time = time
    }

    func addReminder(for body: String, for time: Double) {
        let uuid = UUID().uuidString
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

        let context = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
        do {
            tasks = try context.fetch(Tasks.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
//        task.uuid = uuid
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }

    func getRemindersIdentifiers() -> String {
        UNUserNotificationCenter.current().getPendingNotificationRequests { notificationRequest in
//            var identifiers: [String] = []
            for notification: UNNotificationRequest in notificationRequest {
                self.identifiers.append(notification.identifier)
//                print(notification.identifier)
            }
        }
        print(identifiers.popLast() ?? "")
        return identifiers.popLast() ?? ""
    }
}
