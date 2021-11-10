//
//  DoneViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 04.10.2021.
//

import UIKit
import CoreData

class DoneViewController: UIViewController {

    var tasksDone: [Tasks] = []
    @IBOutlet weak var doneTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        doneTableView.delegate = self
        doneTableView.dataSource = self
        doneTableView.register(UINib(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "TasksCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if SelectedDate.shared.selectedDate == "" {
            CoreDataService.shared.fetchRequest.predicate = NSPredicate(format: "date == %@",
                                                 DateFormatting.shared.formatter.string(from: Date()))
            do {
                tasksDone = try CoreDataService.shared.context.fetch(CoreDataService.shared.fetchRequest)
                tasksDone = tasksDone.filter {$0.gestureSwipeType == true}
            } catch {
                print(error.localizedDescription)
            }
        } else {
            getData()
        }
        doneTableView.reloadData()
    }

    private func getData() {
        CoreDataService.shared.fetchRequest.predicate = NSPredicate(
            format: "date == %@", SelectedDate.shared.selectedDate)
        do {
            tasksDone = try CoreDataService.shared.context.fetch(CoreDataService.shared.fetchRequest)
            tasksDone = tasksDone.filter {$0.gestureSwipeType == true}
        } catch {
            print(error.localizedDescription)
        }
    }
}
