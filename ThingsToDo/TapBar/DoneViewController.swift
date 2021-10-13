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
    var date: Date?
    override func viewDidLoad() {
        super.viewDidLoad()
        doneTableView.delegate = self
        doneTableView.dataSource = self
        doneTableView.register(UINib(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "TasksCell")
//        getData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
        task.getAllTasks(from: doneTableView)
        print(task.formatter.string(from: date ?? Date()))
    }

    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tasksDone = try context.fetch(Tasks.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        tasksDone = tasksDone.filter {$0.date == task.formatter.string(from: date ?? Date())
        }
    }
}
