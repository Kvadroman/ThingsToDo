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
    func updateCell(date: String, label text: String, priorityButton: Bool, doneButton: Bool, reminder: Bool)
}

class NeedToDoViewController: UIViewController {

    lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var tasks = [Tasks]()
    var selectedDate: Date?
    var stateLongType: Bool = false
    var stateSwipeType: Bool = false
    var stateReminder: Bool = false
    @IBOutlet weak var titleNavigationBar: UINavigationItem!
    @IBOutlet weak var needToDoTasksTableView: UITableView!
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
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
                selectVC.date = formatter.string(from: selectedDate ?? Date())
                selectVC.delegate = self
                print(selectVC.date)
            }
        }
    }

@IBAction func returnToNeedToDo(unwindSegue: UIStoryboardSegue) {
    if let segue = unwindSegue.source as? EditCellViewController {
        updateTasks(title: tasks[segue.indexPath], newTitle: segue.editCellTextView.text)
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
    tasks = tasks.filter {$0.date == formatter.string(from: selectedDate ?? Date())}
}

    func createTask(date: String, title: String, priorityButton: Bool, doneButton: Bool, reminder: Bool) {
    let newTask = Tasks(context: context)
    newTask.date = date
    newTask.title = title
    newTask.gestureLongType = priorityButton
    newTask.gestureSwipeType = doneButton
    newTask.reminder = reminder
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
