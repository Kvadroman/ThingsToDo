//
//  PriorityViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 04.10.2021.
//

import UIKit

class PriorityViewController: UIViewController {

    @IBOutlet weak var priorityTableView: UITableView!
    var priorityTasks: [String] = ["1", "1", "1", "1", "1", "1"]
    override func viewDidLoad() {
        super.viewDidLoad()
        priorityTableView.delegate = self
        priorityTableView.dataSource = self
        priorityTableView.register(PriorityCell.self, forCellReuseIdentifier: "PriorityCell")
    }
}