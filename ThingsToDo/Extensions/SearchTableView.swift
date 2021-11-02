//
//  SearchViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 15.10.2021.
//

import UIKit

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell",
                                                       for: indexPath) as? TasksCell else {fatalError()}
        let searchTasks = tasksSearch[indexPath.row]
        cell.textFromCell.text = "\(indexPath.row + 1). \(searchTasks.title ?? "")"
        cell.switchReminder.isOn = searchTasks.reminder
        cell.switchAction = { [weak self] sender in
            searchTasks.reminder = cell.switchReminder.isOn
            do {
                try self?.task.context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
        if searchTasks.gestureSwipeType == true {
            cell.contentView.backgroundColor = .green
            cell.progressLine.isHidden = false
        } else if searchTasks.gestureLongType == true {
            cell.contentView.backgroundColor = .red
            cell.progressLine.isHidden = true
        } else {
            cell.contentView.backgroundColor = .white
            cell.progressLine.isHidden = true
        }
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksSearch.count
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            task.deleteTask(title: tasksSearch.remove(at: indexPath.row), from: searchTableView)
            let cell = searchTableView.cellForRow(at: indexPath) as? TasksCell
            cell?.contentView.backgroundColor = .white
            cell?.progressLine.isHidden = true
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
