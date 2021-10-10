//
//  PriorityViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 05.10.2021.
//

import UIKit

extension PriorityViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.tasks.count
    }
    //        let task = Tasks()
    //        if task.title?.count != 0 {
    //            return task.title?.count ?? 0
    //        }
    //        return 0
    //    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell",
                                                       for: indexPath) as? TasksCell else {fatalError()}
        cell.textFromCell.text = "\(indexPath.row+1). \(task.tasks[indexPath.row].title ?? "")"
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            task.deleteTask(title: task.tasks.remove(at: indexPath.row), from: priorityTableView)
            let cell = priorityTableView.cellForRow(at: indexPath) as? TasksCell
            cell?.progressLine.isHidden = true
            cell?.contentView.backgroundColor = .white
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
