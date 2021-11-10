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
            CoreDataService.shared.fetchRequest.predicate = NSPredicate(format: "date == %@",
                            DateFormatting.shared.formatter.string(from: Date()))
            do {
                taskPriority = try CoreDataService.shared.context.fetch(CoreDataService.shared.fetchRequest)
                taskPriority = taskPriority.filter {$0.gestureLongType == true}
            } catch {
                print(error.localizedDescription)
            }
        } else {
            getData()
        }
        priorityTableView.reloadData()
    }

    private func getData() {
        CoreDataService.shared.fetchRequest.predicate = NSPredicate(
            format: "date == %@", SelectedDate.shared.selectedDate)
        do {
            taskPriority = try CoreDataService.shared.context.fetch(CoreDataService.shared.fetchRequest)
            taskPriority = taskPriority.filter {$0.gestureLongType == true}
        } catch {
            print(error.localizedDescription)
        }
    }
}
