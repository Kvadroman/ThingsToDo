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
        newTaskTextView.font = UIFont(name: Settings.shared.fontFace ?? "",
                                      size: CGFloat(Settings.shared.sliderValue ?? 0.1))
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if newTaskTextView.text.isEmpty == true {
            showAlert(msg: "", inViewController: self, title: "Please type something in field")
        } else {
            UNUserNotificationCenter.current().requestAuthorization(options:
                                                                        [.alert, .badge, .sound]) { success, error in
                if success {
                    DispatchQueue.main.async {
                        if segue.identifier == "reminderViewController" {
                            if let selecVC = segue.destination as? ReminderViewController {
                                selecVC.textFromNewTask = self.newTaskTextView.text
                                self.reminderSwitch.isOn = true
                                self.navigationItem.backButtonTitle = "Event"
                            }
                        }
                    }
                } else if let error = error {
                    print("\(error)")
                }
            }
        }
    }

    @IBAction func reminderButton(_ sender: UIButton) {
    }

    @IBAction func saveTextFromTextField(_ sender: UIBarButtonItem) {
        if newTaskTextView.text == "" {
            showAlert(msg: "", inViewController: self, title: "Please fill the fields")
        } else if prioritySwitch.isOn == true, doneSwitch.isOn == true {
            showAlert(msg: "", inViewController: self, title:
                        "Please choose only one position for Priority Task or Done")
        } else {
            delegate?.updateCell(date: date, label: newTaskTextView.text, priorityButton:
                                    prioritySwitch.isOn, doneButton: doneSwitch.isOn, reminder: reminderSwitch.isOn)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
