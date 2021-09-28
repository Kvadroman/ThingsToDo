//
//  NewTaskViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 28.09.2021.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    @IBOutlet weak var doneSwitch: UISwitch!
    @IBOutlet weak var reminderSwitch: UISwitch!
    @IBOutlet weak var prioritySwitch: UISwitch!
    @IBOutlet weak var backButton: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        prioritySwitch.colorUISwitch()
        reminderSwitch.colorUISwitch()
        doneSwitch.colorUISwitch()
    }
}

