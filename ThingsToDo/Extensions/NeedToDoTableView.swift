//
//  NeedToDoTableViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 27.09.2021.
//

import UIKit

extension NeedToDoViewController: UITableViewDelegate, UITableViewDataSource, NeedToDoViewControllerDelegate {
    func updateCell(date: String, label text: String, priorityButton: Bool, doneButton: Bool, reminder: Bool) {
        createTask(date: date, title: text, priorityButton: priorityButton, doneButton: doneButton, reminder: reminder)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tasks.count != 0 {
            return tasks.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell", for: indexPath)
                as? TasksCell else {fatalError()}
        let task = tasks[indexPath.row]
        cell.textFromCell.text = "\(indexPath.row+1). \(task.title ?? "")"
        cell.switchReminder.isOn = task.reminder
        if self.traitCollection.userInterfaceStyle == .dark {
            cell.contentView.backgroundColor = .black
        } else {
            cell.contentView.backgroundColor = .white
        }
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeTapEdit(recognizer:)))
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(longTapEdit(recognizer:)))
        cell.contentView.addGestureRecognizer(longTap)
        cell.contentView.addGestureRecognizer(swipeGesture)
        stateSwipeType = task.gestureSwipeType
        stateLongType = task.gestureLongType
        if stateSwipeType == true {
            cell.contentView.backgroundColor = .green
            cell.progressLine.isHidden = false
        } else if stateLongType == true {
            cell.contentView.backgroundColor = .red
            cell.progressLine.isHidden = true
        } else {
            cell.contentView.backgroundColor = .white
            cell.progressLine.isHidden = true
        }
        return cell
    }

    @objc func swipeTapEdit(recognizer: UISwipeGestureRecognizer) {
        let tapLocation = recognizer.location(in: self.needToDoTasksTableView)
        if let tapIndexPath = self.needToDoTasksTableView.indexPathForRow(at: tapLocation) {
            if let tappedCell = self.needToDoTasksTableView.cellForRow(at: tapIndexPath) as? TasksCell {
                let task = tasks[tapIndexPath.row]
                stateSwipeType = task.gestureSwipeType
                if stateSwipeType == true {
                    tappedCell.contentView.backgroundColor = .green
                    tappedCell.progressLine.isHidden = false
                } else {
                    tappedCell.contentView.backgroundColor = .white
                    tappedCell.progressLine.isHidden = true
                }
                stateSwipeType.toggle()
                task.gestureSwipeType = stateSwipeType
                saveAndUpdate(from: needToDoTasksTableView)
            }
        }
    }

    @objc func longTapEdit(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state != .began {return}
        let tapLocation = recognizer.location(in: self.needToDoTasksTableView)
        if let tapIndexPath = self.needToDoTasksTableView.indexPathForRow(at: tapLocation) {
            if let tappedCell = self.needToDoTasksTableView.cellForRow(at: tapIndexPath) as? TasksCell {
                let task = tasks[tapIndexPath.row]
                stateLongType = task.gestureLongType
                if stateLongType == true {
                    tappedCell.contentView.backgroundColor = .red
                    tappedCell.progressLine.isHidden = true
                } else {
                    tappedCell.contentView.backgroundColor = .white
                    tappedCell.progressLine.isHidden = true
                }
                stateLongType.toggle()
                task.gestureLongType = stateLongType
                saveAndUpdate(from: needToDoTasksTableView)
            }
        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteTask(title: tasks.remove(at: indexPath.row), from: needToDoTasksTableView)
            let cell = needToDoTasksTableView.cellForRow(at: indexPath) as? TasksCell
            cell?.progressLine.isHidden = true
            cell?.contentView.backgroundColor = .white
            cell?.switchReminder.isOn = false
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier:
                        "EditCellViewController") as? EditCellViewController else {return}
        vc.editText = "\(tasks[indexPath.row].title ?? "")"
        vc.indexPath = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
}
