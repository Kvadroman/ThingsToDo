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
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.overrideUserInterfaceStyle = Settings.shared.appTheme ?? .unspecified
        calendar.appearance.titleFont = UIFont(name: Settings.shared.fontFace ?? "",
                                               size: CGFloat(Settings.shared.sliderValue ?? 20))
        calendar.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let config = segue.destination as? NeedToDoViewController {
            config.selectedDate = calendar.selectedDate
            SelectedDate.shared.selectedDate = DateFormatting.shared.formatter.string(
                from: calendar.selectedDate ?? Date())
            navigationItem.backButtonTitle = "Back"
        }
    }
}
