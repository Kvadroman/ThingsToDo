//
//  ColorThemeViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 13.10.2021.
//

import UIKit

class ColorThemeViewController: UIViewController {

    var userDefaults = UserDefaults.standard
    var colorImageArray: [String] = ["lightbulb", "lightbulb.fill"]
    var colorTitleArray: [String] = ["Light Theme", "Dark Theme"]
    @IBOutlet weak var colorThemeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        colorThemeTableView.delegate = self
        colorThemeTableView.dataSource = self
    }
}
