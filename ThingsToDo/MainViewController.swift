//
//  ViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 27.09.2021.
//

import UIKit
import FSCalendar

class MainViewController: UIViewController {

    lazy var tasks = [Tasks]()
    @IBOutlet weak var calendar: FSCalendar!
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()

    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.overrideUserInterfaceStyle = Settings.shared.appTheme ?? .unspecified
        calendar.appearance.titleFont = UIFont(name: Settings.shared.fontFace ?? "",
                                               size: CGFloat(Settings.shared.sliderValue ?? 0.1))
        calendar.reloadData()
    }

    override func willTransition(to newCollection: UITraitCollection,
                                 with coordinator: UIViewControllerTransitionCoordinator) {
        self.calendar?.reloadData()
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
