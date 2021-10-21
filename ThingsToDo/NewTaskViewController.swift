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
    var date: String = ""
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
        if newTaskTextView.text.isEmpty == true {
            showAlert(msg: "", inViewController: self, title: "Please type something in field")
        } else {
            UNUserNotificationCenter.current().requestAuthorization(options:
                                                                        [.alert, .badge, .sound]) { success, error in
                if success {
//                    DispatchQueue.main.async {
//                        self.addReminder(for: self.newTaskTextView.text, for: 5)
//                    }
                } else if let error = error {
                    print("\(error)")
                }
            }
            if segue.identifier == "reminderViewController" {
                if let selecVC = segue.destination as? ReminderViewController {
                    selecVC.textFromNewTask = newTaskTextView.text
                    print(selecVC.textFromNewTask)
                    reminderSwitch.isOn = true
                    navigationItem.backButtonTitle = "Event"
                }
            }
        }
    }

    @IBAction func reminderButton(_ sender: UIButton) {
    }

    func addReminder(for body: String, for time: Double) {
        let content = UNMutableNotificationContent()
        content.title = "ThingsToDo"
        content.sound = .default
        content.body = body
        let targetDate = Date().addingTimeInterval(time)
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
            delegate?.updateCell(date: date, label: newTaskTextView.text, priorityButton:
                                    prioritySwitch.isOn, doneButton: doneSwitch.isOn)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
