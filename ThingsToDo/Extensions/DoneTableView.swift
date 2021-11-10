//
//  DoneTableView.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 10.10.2021.
//

import UIKit

extension DoneViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksDone.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell",
                                                       for: indexPath) as? TasksCell else {fatalError()}
        let taskDone = tasksDone[indexPath.row]
        cell.setupTitleCell(indexPath: indexPath.row, task: tasksDone)
        cell.fontFace()
        cell.backgroundColorCellDonePriority(gesture: taskDone.gestureSwipeType, color: .green)
        cell.switchAction = { _ in
            taskDone.reminder = cell.switchReminder.isOn
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [taskDone.uuid!])
            CoreDataService.shared.saveTask()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CoreDataService.shared.deleteTask(title: tasksDone.remove(at: indexPath.row))
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
