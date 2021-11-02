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
        cell.switchReminder.isOn = taskDone.reminder
        cell.switchAction = { [weak self] sender in
            taskDone.reminder = cell.switchReminder.isOn
            do {
                try self?.task.context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
        cell.fontFace()
        task.stateSwipeType = taskDone.gestureSwipeType
        if task.stateSwipeType == true {
            cell.contentView.backgroundColor = .green
            cell.progressLine.isHidden = false
        } else {
            cell.contentView.backgroundColor = .white
            cell.progressLine.isHidden = true
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
