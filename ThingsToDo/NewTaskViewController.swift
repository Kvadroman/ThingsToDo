//
//  NewTaskViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 28.09.2021.
//

import UIKit
import UserNotifications
import FSCalendar

class NewTaskViewController: UIViewController {
    
    weak var delegate: NeedToDoViewControllerDelegate?
    @IBOutlet weak var newTaskTextView: UITextView!
    @IBOutlet weak var backButtonNavigationBar: UINavigationItem!
    @IBOutlet weak var reminderSwitch: UISwitch!
    @IBOutlet weak var prioritySwitch: UISwitch!
    @IBOutlet weak var doneSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        newTaskTextView.becomeFirstResponder()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backButtonTitle = "Event"
    }
    
    @IBAction func reminderButton(_ sender: Any) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                self.addReminder()
            } else if let error = error {
                print("\(error)")
            }
        }
    }
    
    func addReminder() {
        let content = UNMutableNotificationContent()
        content.title = "Hello world"
        content.sound = .default
        content.body = "Here is the reminder"
        let targetDate = Date().addingTimeInterval(5)
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([
            .year, .month, .day, .hour, .minute, .second], from: targetDate), repeats: false)
        let request = UNNotificationRequest(identifier: "id", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if error != nil {
                fatalError()
            }
        })
    }
    @IBAction func saveTextFromTextField(_ sender: UIBarButtonItem) {
        if newTaskTextView.text == "" {
            showAlert(msg: "", inViewController: self, title: "Please fill the fields")
        } else if prioritySwitch.isOn == doneSwitch.isOn {
            showAlert(msg: "", inViewController: self, title:
                        "Please choose only one position for Priority Task or Done")
        } else {
            delegate?.updateCell(label: newTaskTextView.text, priorityButton:
                                    prioritySwitch.isOn, doneButton: doneSwitch.isOn)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
