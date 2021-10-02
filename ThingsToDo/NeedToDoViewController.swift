//
//  NeedToDoViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 27.09.2021.
//

import UIKit
import FSCalendar

protocol NeedToDoViewControllerDelegate: AnyObject {
    func updateCell(label text: String)
}

class NeedToDoViewController: UIViewController {

    let identifier = "TasksCell"
    var tasks: [String] = []
    var selectedDate: Date?
    @IBOutlet weak var titleNavigationBar: UINavigationItem!
    @IBOutlet weak var needToDoTasks: UITableView!
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        needToDoTasks.register(UINib(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "TasksCell")
        if let d = selectedDate {
            titleNavigationBar.title = formatter.string(from: d)
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        needToDoTasks.reloadData()
        print(tasks)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewTaskViewController" {
            if let selectVC = segue.destination as? NewTaskViewController {
                selectVC.delegate = self
            }
        }
        navigationItem.backButtonTitle = "NeedToDo"
    }

//    @IBAction func unwind(unwindSegue: UIStoryboardSegue) {
//        if let save = unwindSegue.source as? NewTaskViewController {
//            if save.newTaskTextField.text == "" {
//                print("null")
//            } else {
//                tasks.append(save.newTaskTextField.text)
//            }
//        }
//    }
}
