//
//  ColorThemeViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 13.10.2021.
//

import UIKit

class ColorThemeViewController: UIViewController {

    @IBOutlet weak var colorThemeTableView: UITableView!
    var colorImageArray: [String] = ["lightbulb", "lightbulb.fill"]
    var colorTitleArray: [String] = ["Light Theme", "Dark Theme"]
    override func viewDidLoad() {
        super.viewDidLoad()
        colorThemeTableView.delegate = self
        colorThemeTableView.dataSource = self
    }
}
