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
    var tasksDone: [Tasks] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        doneTableView.delegate = self
        doneTableView.dataSource = self
        doneTableView.register(UINib(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "TasksCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
        task.getAllTasks(from: doneTableView)
    }

    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tasksDone = try context.fetch(Tasks.fetchRequest())
        } catch {
            print(error)
        }
        tasksDone = tasksDone.filter {$0.gestureSwipeType == true}
    }
}
