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
        let taskPriority = taskPriority[indexPath.row]
        cell.textFromCell.text = "\(indexPath.row+1). \(taskPriority.title ?? "")"
        task.stateLongType = taskPriority.gestureLongType
        if task.stateLongType == true {
            cell.contentView.backgroundColor = .red
            cell.progressLine.isHidden = true
        } else {
            cell.contentView.backgroundColor = .white
            cell.progressLine.isHidden = true
        }
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            task.deleteTask(title: taskPriority.remove(at: indexPath.row), from: priorityTableView)
            let cell = priorityTableView.cellForRow(at: indexPath) as? TasksCell
            cell?.progressLine.isHidden = true
            cell?.contentView.backgroundColor = .white
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
