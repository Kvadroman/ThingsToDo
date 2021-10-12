//
//  NeedToDoViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 27.09.2021.
//

import UIKit
import FSCalendar
import CoreData

protocol NeedToDoViewControllerDelegate: AnyObject {
    func updateCell(label text: String)
}

class NeedToDoViewController: UIViewController {

    lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var tasks = [Tasks]()
    var selectedDate: Date?
    var stateLongType: Bool = false
    var stateSwipeType: Bool = false
    @IBOutlet weak var titleNavigationBar: UINavigationItem!
    @IBOutlet weak var needToDoTasksTableView: UITableView!
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        needToDoTasksTableView.register(UINib(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "TasksCell")
        if let d = selectedDate {
            titleNavigationBar.title = formatter.string(from: d)
        }
        needToDoTasksTableView.dataSource = self
        needToDoTasksTableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllTasks(from: needToDoTasksTableView)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewTaskViewController" {
            if let selectVC = segue.destination as? NewTaskViewController {
                selectVC.delegate = self
            }
        }
        navigationItem.backButtonTitle = "NeedToDo"
    }
    // NEW ACTION
    @IBAction func returnToNeedToDo(unwindSegue: UIStoryboardSegue) {
        if let segue = unwindSegue.source as? EditCellViewController {
            updateTasks(title: tasks[segue.indexPath], newTitle: segue.editCellTextView.text)
            print(tasks)
        }
    }

    func getAllTasks(from table: UITableView) {
        do {
            tasks = try context.fetch(Tasks.fetchRequest())
            DispatchQueue.main.async {
                table.reloadData()}
        } catch {
            print(error.localizedDescription)
        }
    }

    func createTask(title: String) {
        let newTask = Tasks(context: context)
        newTask.title = title
        do {
            try context.save()
            getAllTasks(from: needToDoTasksTableView)
        } catch {
            print(error.localizedDescription)
        }
    }

    func deleteTask(title: Tasks, from table: UITableView) {
        context.delete(title)
        do {
            try context.save()
            getAllTasks(from: table)
        } catch {
            print(error.localizedDescription)
        }
    }

    func updateTasks(title: Tasks, newTitle: String) {
        title.title = newTitle
        do {
            try context.save()
            getAllTasks(from: needToDoTasksTableView)
        } catch {
            print(error.localizedDescription)
        }
    }

    func saveAndUpdate(from table: UITableView) {
        do {
            try context.save()
            getAllTasks(from: table)
        } catch {
            print(error.localizedDescription)
        }
    }
}
