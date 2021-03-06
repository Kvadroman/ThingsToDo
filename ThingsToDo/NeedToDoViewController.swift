//
//  NeedToDoViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 27.09.2021.
//

import UIKit
import CoreData

protocol NeedToDoViewControllerDelegate: AnyObject {
    func updateCell(date: String, label text: String, priorityButton: Bool,
                    doneButton: Bool, reminder: Bool, uuid: String)
}

class NeedToDoViewController: UIViewController {

    var tasks = [Tasks]()
    var selectedDate: Date?
    @IBOutlet weak var titleNavigationBar: UINavigationItem!
    @IBOutlet weak var needToDoTasksTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let d = selectedDate {
            titleNavigationBar.title = DateFormatting.shared.formatter.string(from: d)
        }
        needToDoTasksTableView.register(UINib(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "TasksCell")
        needToDoTasksTableView.dataSource = self
        needToDoTasksTableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CoreDataService.shared.getAllTasks()
        tasks = CoreDataService.shared.tasks.filter {$0.date == DateFormatting.shared.formatter.string(
            from: selectedDate ?? Date())}
        needToDoTasksTableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewTaskViewController" {
            if let selectVC = segue.destination as? NewTaskViewController {
                selectVC.date = DateFormatting.shared.formatter.string(from: selectedDate ?? Date())
                selectVC.delegate = self
            }
        }
    }

    @IBAction func returnToNeedToDo(unwindSegue: UIStoryboardSegue) {
        if let segue = unwindSegue.source as? EditCellViewController {
            CoreDataService.shared.updateTask(title: tasks[segue.indexPath], newTitle: segue.editCellTextView.text)
        }
    }
}
