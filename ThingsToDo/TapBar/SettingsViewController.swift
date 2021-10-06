//
//  SettingsViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 04.10.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    var settingsCell: [String] = ["building.2.crop.circle.fill", "character", "mount.fill", "iphone", "envelope.fill"]
    var settingsArray: [String] = ["Color Theme", "Font Face", "Font Size", "Change App Icon",
                                   "Contact Me (via E-mail)"]

    @IBOutlet weak var settings: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settings.dataSource = self
        settings.delegate = self
    }
}
