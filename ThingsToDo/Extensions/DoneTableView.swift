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
        cell.textFromCell.text = "\(indexPath.row+1). \(taskDone.title ?? "")"
        task.stateSwipeType = taskDone.gestureSwipeType
        if task.stateSwipeType == true {
            cell.contentView.backgroundColor = .green
            cell.progressLine.isHidden = false
            print("stateSwipeType in tableview \(indexPath.row) is true")
        } else {
            cell.contentView.backgroundColor = .white
            cell.progressLine.isHidden = true
            print("stateSwipeType in tableview \(indexPath.row) is false")
        }
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            task.deleteTask(title: tasksDone.remove(at: indexPath.row), from: doneTableView)
            let cell = doneTableView.cellForRow(at: indexPath) as? TasksCell
            cell?.progressLine.isHidden = true
            cell?.contentView.backgroundColor = .white
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
