//
//  ChangeAppIconViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 13.10.2021.
//

import UIKit

class ChangeAppIconViewController: UIViewController {

    let changeAppIconTextArray = ["Rabit Icon", "Default Icon"]
    let changeAppIconImageArray = ["rabit", "default"]
    @IBOutlet weak var changeAppIconTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Change App Icon"
        changeAppIconTableView.delegate = self
        changeAppIconTableView.dataSource = self
    }
 }
