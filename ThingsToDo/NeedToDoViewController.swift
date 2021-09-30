//
//  NeedToDoViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 27.09.2021.
//

import UIKit
import FSCalendar

class NeedToDoViewController: UIViewController {

    var tasks: [String] = []
    var selectedDate: Date?
    @IBOutlet weak var titleNavigationBar: UINavigationItem!
    @IBOutlet weak var needToDoTasks: UITableView!
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        needToDoTasks.register(UINib(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "tasksCell")
        if let d = selectedDate {
            titleNavigationBar.title = formatter.string(from: d)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        needToDoTasks.reloadData()
        needToDoTasks.tableFooterView = UIView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backButtonTitle = "NeedToDo"
    }

    @IBAction func unwind(unwindSegue: UIStoryboardSegue) {
        if let save = unwindSegue.source as? NewTaskViewController {
            tasks.append(save.newTaskTextField.text)

        }
    }
}
