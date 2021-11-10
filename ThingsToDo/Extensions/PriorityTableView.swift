//
//  PriorityViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 05.10.2021.
//

import UIKit

extension PriorityViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskPriority.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell",
                                                       for: indexPath) as? TasksCell else {fatalError()}
        let tasksPriority = taskPriority[indexPath.row]
        cell.setupTitleCell(indexPath: indexPath.row, task: taskPriority)
        cell.fontFace()
        cell.backgroundColorCellDonePriority(gesture: tasksPriority.gestureLongType, color: .red, crossedOut: true)
        cell.switchAction = { _ in
            tasksPriority.reminder = cell.switchReminder.isOn
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [tasksPriority.uuid!])
            CoreDataService.shared.saveTask()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CoreDataService.shared.deleteTask(title: taskPriority.remove(at: indexPath.row))
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
