//
//  PriorityViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 04.10.2021.
//

import UIKit
import CoreData

class PriorityViewController: UIViewController {

    @IBOutlet weak var priorityTableView: UITableView!
    let task = NeedToDoViewController()
    var taskPriority: [Tasks] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        priorityTableView.delegate = self
        priorityTableView.dataSource = self
        priorityTableView.register(UINib(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "TasksCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
        task.getAllTasks(from: priorityTableView)
    }

    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            taskPriority = try context.fetch(Tasks.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        taskPriority = taskPriority.filter {$0.gestureLongType == true}
    }
}
