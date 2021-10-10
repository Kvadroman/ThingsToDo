//
//  DoneViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 04.10.2021.
//

import UIKit

class DoneViewController: UIViewController {

    @IBOutlet weak var doneTableView: UITableView!
    let task = NeedToDoViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        doneTableView.delegate = self
        doneTableView.dataSource = self
        doneTableView.register(UINib(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "TasksCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        task.getAllTasks(from: doneTableView)
    }
}
