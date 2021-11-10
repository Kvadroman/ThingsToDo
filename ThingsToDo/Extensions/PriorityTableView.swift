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
        cell.switchReminder.isOn = taskPriority.reminder
        cell.switchAction = { _ in
            taskPriority.reminder = cell.switchReminder.isOn
            CoreDataService.shared.saveTask()
        }
        cell.fontFace()
        if taskPriority.gestureLongType == true {
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
            CoreDataService.shared.deleteTask(title: taskPriority.remove(at: indexPath.row))
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
