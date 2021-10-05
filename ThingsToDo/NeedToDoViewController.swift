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

    var state: Bool = false
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
        needToDoTasks.dataSource = self
        needToDoTasks.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        needToDoTasks.reloadData()
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
            tasks.remove(at: segue.indexPath)
            tasks.insert(segue.editCellTextView.text, at: segue.indexPath)
        }
    }
}
