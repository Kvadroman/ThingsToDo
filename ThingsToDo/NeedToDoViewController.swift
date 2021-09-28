//
//  NeedToDoViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 27.09.2021.
//

import UIKit
import FSCalendar

class NeedToDoViewController: UIViewController {
    
    @IBOutlet weak var titleNavigationBar: UINavigationItem!
    var selectedDate: Date?
    @IBOutlet weak var needToDoTasks: UITableView!
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        needToDoTasks.register(UINib(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "tasksCell")
        if let d = selectedDate {
                    titleNavigationBar.title = formatter.string(from: d)
                }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            navigationItem.backButtonTitle = "NeedToDo"
//        if let config = segue.destination as? NewTaskViewController {
//            config.prioritySwitch.isOn ? UIColor.red : UIColor.blue
//            }
        }
        }
    




