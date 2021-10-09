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

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var tasks = [Tasks]()
    var selectedDate: Date?
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
        getAllTasks()

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
//            let task = Tasks(context: context)
//            task.title = segue.editCellTextView.text
//            deleteTask(title: tasks[segue.indexPath])
//            tasks.remove(at: segue.indexPath)
            updateTasks(title: tasks[segue.indexPath], newTitle: segue.editCellTextView.text)
//            createTask(title: segue.editCellTextView.text)
//            tasks.insert(segue.editCellTextView.text, at: segue.indexPath)
            print(tasks)
        }
    }

    func getAllTasks () {
        do {
            tasks = try context.fetch(Tasks.fetchRequest())
            DispatchQueue.main.async {
                self.needToDoTasksTableView.reloadData()}
        } catch {
            print(error)
        }
    }

    func createTask(title: String) {
        let newTask = Tasks(context: context)
        newTask.title = title
        do {
            try context.save()
            getAllTasks()
        } catch {
            print(error)
        }
    }

    func deleteTask(title: Tasks) {
        context.delete(title)
        do {
            try context.save()
            getAllTasks()
        } catch {
            print(error)
        }
    }

    func updateTasks(title: Tasks, newTitle: String) {
        title.title = newTitle
        do {
            try context.save()
            getAllTasks()
        } catch {
            print(error)
        }
    }
}
