//
//  SearchViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 15.10.2021.
//

import UIKit

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksSearch.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell",
                                                       for: indexPath) as? TasksCell else {fatalError()}
        let searchTasks = tasksSearch[indexPath.row]
        cell.setupTitleCell(indexPath: indexPath.row, task: tasksSearch)
        cell.fontFace()
        cell.backgroundColorCellUserInterfaceStyle()
        cell.backgroundColorCellGesture(array: tasksSearch, indexPath: indexPath.row)
        cell.switchAction = { _ in
            searchTasks.reminder = cell.switchReminder.isOn
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [searchTasks.uuid!])
            CoreDataService.shared.saveTask()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CoreDataService.shared.deleteTask(title: tasksSearch.remove(at: indexPath.row))
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
