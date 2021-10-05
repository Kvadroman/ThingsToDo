//
//  ViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 27.09.2021.
//

import UIKit
import FSCalendar

class MainViewController: UIViewController {

    var tasksMain: [String] = []
    @IBOutlet weak var calendar: FSCalendar!
    override func viewWillAppear(_ animated: Bool) {
        calendar.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let config = segue.destination as? NeedToDoViewController {
            config.selectedDate = calendar.selectedDate
            navigationItem.backButtonTitle = "Back"
            config.selectedDate = self.calendar.selectedDate
        }
    }

    @IBAction func returnToNeedToDo(unwindSegue: UIStoryboardSegue) {
        if let segue = unwindSegue.source as? NeedToDoViewController {
            tasksMain.insert(contentsOf: segue.tasks, at: 0)
            print(tasksMain)
        }
    }
}
