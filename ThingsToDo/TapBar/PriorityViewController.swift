//
//  PriorityViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 04.10.2021.
//

import UIKit

class PriorityViewController: UIViewController {

    @IBOutlet weak var priorityTableView: UITableView!
    let task = NeedToDoViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        priorityTableView.delegate = self
        priorityTableView.dataSource = self
        priorityTableView.register(UINib(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "TasksCell")
    }
}
