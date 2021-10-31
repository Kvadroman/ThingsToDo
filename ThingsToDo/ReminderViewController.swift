//
//  ReminderViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 29.09.2021.
//

import UIKit

class ReminderViewController: UIViewController {

    var textFromNewTask: String = ""
    @IBAction func noReminderButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func atTheTimeReminderButton(_ sender: UIButton) {
        reminderTime(for: 60)
    }
    @IBAction func inFiveMinutesReminderButton(_ sender: UIButton) {
       reminderTime(for: 300)
    }
    @IBAction func inTenMinutesReminderButton(_ sender: UIButton) {
        reminderTime(for: 600)
    }
    @IBAction func inFiftheenMinutesReminderButton(_ sender: UIButton) {
        reminderTime(for: 900)
    }
    @IBAction func inThirthyMinutesReminderButton(_ sender: UIButton) {
        reminderTime(for: 1800)
    }
    @IBAction func inOneHourReminderButton(_ sender: UIButton) {
        reminderTime(for: 3600)
    }
    @IBAction func inTwoHourReminderButton(_ sender: UIButton) {
        reminderTime(for: 7200)
    }
    @IBAction func inOneDayReminderButton(_ sender: UIButton) {
        reminderTime(for: 86400)
    }
    @IBAction func inTwoDayReminderButton(_ sender: UIButton) {
        reminderTime(for: 172800)
    }
    @IBAction func inOneWeekReminderButton(_ sender: UIButton) {
        reminderTime(for: 604800)
    }

    func reminderTime(for time: Double) {
        ReminderModel.shared.addReminder(for: textFromNewTask, for: time)
        navigationController?.popViewController(animated: true)
    }
}
