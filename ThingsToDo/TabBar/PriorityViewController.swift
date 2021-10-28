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
        if SelectedDate.shared.selectedDate == "" {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "date == %@",
                    task.formatter.string(from: task.selectedDate ?? Date()))
            do {
                taskPriority = try context.fetch(fetchRequest)
                taskPriority = taskPriority.filter {$0.gestureLongType == true}
            } catch {
                print(error.localizedDescription)
            }
        } else {
            getData()
        }
        priorityTableView.reloadData()
    }

    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date == %@", SelectedDate.shared.selectedDate)
        do {
            taskPriority = try context.fetch(fetchRequest)
            taskPriority = taskPriority.filter {$0.gestureLongType == true}
            priorityTableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
}
