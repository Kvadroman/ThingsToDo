//
//  ReminderViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 29.09.2021.
//

import UIKit

class ReminderViewController: UIViewController {

    var textFromNewTask: String = ""
    var uuid: String = ""
    var time: Double = 0
    @IBAction func noReminderButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func atOneMinuteButton(_ sender: UIButton) {
        reminderTime(for: 20)
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

    func reminderTime(for timer: Double) {
        time = timer
        navigationController?.popViewController(animated: true)
    }
}
