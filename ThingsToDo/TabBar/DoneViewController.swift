//
//  DoneViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 04.10.2021.
//

import UIKit
import CoreData

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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if SelectedDate.shared.selectedDate == "" {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "date == %@",
                    task.formatter.string(from: task.selectedDate ?? Date()))
            do {
                tasksDone = try context.fetch(fetchRequest)
                tasksDone = tasksDone.filter {$0.gestureSwipeType == true}
            } catch {
                print(error.localizedDescription)
            }
        } else {
            getData()
        }
        doneTableView.reloadData()
    }

    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date == %@", SelectedDate.shared.selectedDate)
        do {
            tasksDone = try context.fetch(fetchRequest)
            tasksDone = tasksDone.filter {$0.gestureSwipeType == true}
            doneTableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
}
