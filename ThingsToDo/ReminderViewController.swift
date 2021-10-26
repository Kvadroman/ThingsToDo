//
//  ReminderViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 29.09.2021.
//

import UIKit
import UserNotifications

class ReminderViewController: UIViewController {

    var textFromNewTask: String = ""
    var reminder = NewTaskViewController()
    @IBAction func atTheTimeReminderButton(_ sender: UIButton) {
        reminder.addReminder(for: textFromNewTask, for: 5)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func inFiveMinutesReminderButton(_ sender: UIButton) {
        reminder.addReminder(for: textFromNewTask, for: 30)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func inTenMinutesReminderButton(_ sender: UIButton) {
        reminder.addReminder(for: reminder.newTaskTextView.text, for: 600)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func inFiftheenMinutesReminderButton(_ sender: UIButton) {
        reminder.addReminder(for: reminder.newTaskTextView.text, for: 900)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func inThirthyMinutesReminderButton(_ sender: UIButton) {
        reminder.addReminder(for: reminder.newTaskTextView.text, for: 1800)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func inOneHourReminderButton(_ sender: UIButton) {
        reminder.addReminder(for: reminder.newTaskTextView.text, for: 3600)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func inTwoHourReminderButton(_ sender: UIButton) {
        reminder.addReminder(for: reminder.newTaskTextView.text, for: 7200)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func inOneDayReminderButton(_ sender: UIButton) {
        reminder.addReminder(for: reminder.newTaskTextView.text, for: 86400)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func inTwoDayReminderButton(_ sender: UIButton) {
        reminder.addReminder(for: reminder.newTaskTextView.text, for: 172800)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func inOneWeekReminderButton(_ sender: UIButton) {
        reminder.addReminder(for: reminder.newTaskTextView.text, for: 604800)
        navigationController?.popViewController(animated: true)
    }
}
