//
//  MainFsCalendar.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 27.09.2021.
//

import UIKit
import FSCalendar

extension MainViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.performSegue(withIdentifier: "gotoNeedToDo", sender: nil)
    }
}

extension MainViewController: FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        CoreDataService.shared.getAllTasks()
        tasks = CoreDataService.shared.tasks
        tasks = tasks.filter {$0.date == DateFormatting.shared.formatter.string(from: date)}
        return tasks.count
    }
}

extension MainViewController: FSCalendarDelegateAppearance {

    func calendar(_ _calendar: FSCalendar, appearance: FSCalendarAppearance,
                  titleDefaultColorFor date: Date) -> UIColor? {
        let defaultColor = appearance.titleDefaultColor
        if self.traitCollection.userInterfaceStyle == .dark {
            return .white
        } else {
            return defaultColor
        }
    }

    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance,
                  eventDefaultColorsFor date: Date) -> [UIColor]? {
        if self.traitCollection.userInterfaceStyle == .dark {
            return [UIColor.white]
        } else {
            return [UIColor.black]
        }
    }
}
