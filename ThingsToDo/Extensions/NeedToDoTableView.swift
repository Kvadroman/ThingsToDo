//
//  NeedToDoTableViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 27.09.2021.
//

import UIKit

extension NeedToDoViewController: UITableViewDelegate, UITableViewDataSource, NeedToDoViewControllerDelegate {
    func updateCell(date: String, label text: String,
                    priorityButton: Bool, doneButton: Bool, reminder: Bool, uuid: String) {
        CoreDataService.shared.createTask(date: date, title: text, priorityButton: priorityButton,
                   doneButton: doneButton, reminder: reminder, uuid: uuid)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         tasks.count != 0 ? tasks.count : 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell", for: indexPath)
                as? TasksCell else {fatalError()}
        let task = tasks[indexPath.row]
        cell.textFromCell.text = "\(indexPath.row+1). \(task.title ?? "")"
        cell.switchReminder.isOn = task.reminder
        cell.switchAction = { _ in
            task.reminder = cell.switchReminder.isOn
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [task.uuid!])
            CoreDataService.shared.saveTask()
        }
        cell.fontFace()
        cell.backgroundColorCellUserInterfaceStyle()
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeTapEdit(recognizer:)))
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(longTapEdit(recognizer:)))
        cell.contentView.addGestureRecognizer(longTap)
        cell.contentView.addGestureRecognizer(swipeGesture)
        cell.backgroundColorCellGesture(array: tasks, indexPath: indexPath.row)
        return cell
    }

    @objc func swipeTapEdit(recognizer: UISwipeGestureRecognizer) {
        let tapLocation = recognizer.location(in: self.needToDoTasksTableView)
        if let tapIndexPath = self.needToDoTasksTableView.indexPathForRow(at: tapLocation) {
            if let tappedCell = self.needToDoTasksTableView.cellForRow(at: tapIndexPath) as? TasksCell {
                let task = tasks[tapIndexPath.row]
                if task.gestureSwipeType == true {
                    tappedCell.contentView.backgroundColor = .green
                    tappedCell.progressLine.isHidden = false
                } else {
                    tappedCell.contentView.backgroundColor = .white
                    tappedCell.progressLine.isHidden = true
                }
                task.gestureSwipeType.toggle()
                CoreDataService.shared.saveTask()
                needToDoTasksTableView.reloadData()
            }
        }
    }

    @objc func longTapEdit(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state != .began {return}
        let tapLocation = recognizer.location(in: self.needToDoTasksTableView)
        if let tapIndexPath = self.needToDoTasksTableView.indexPathForRow(at: tapLocation) {
            if let tappedCell = self.needToDoTasksTableView.cellForRow(at: tapIndexPath) as? TasksCell {
                let task = tasks[tapIndexPath.row]
                if task.gestureLongType == true {
                    tappedCell.contentView.backgroundColor = .red
                    tappedCell.progressLine.isHidden = true
                } else {
                    tappedCell.contentView.backgroundColor = .white
                    tappedCell.progressLine.isHidden = true
                }
                task.gestureLongType.toggle()
                CoreDataService.shared.saveTask()
                needToDoTasksTableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CoreDataService.shared.deleteTask(title: tasks.remove(at: indexPath.row))
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
