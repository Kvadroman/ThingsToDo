//
//  ViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 27.09.2021.
//

import UIKit
import FSCalendar

class MainViewController: UIViewController {

    lazy var task = NeedToDoViewController()
    lazy var tasks = [Tasks]()
    @IBOutlet weak var calendar: FSCalendar!
    override func viewWillAppear(_ animated: Bool) {
        calendar.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let config = segue.destination as? NeedToDoViewController {
            config.selectedDate = calendar.selectedDate
            SelectedDate.shared.selectedDate = config.formatter.string(from: calendar.selectedDate ?? Date())
            navigationItem.backButtonTitle = "Back"
            print(SelectedDate.shared.selectedDate)
        }
    }
}
