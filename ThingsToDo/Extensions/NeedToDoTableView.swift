//
//  NeedToDoTableViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 27.09.2021.
//

import UIKit

extension NeedToDoViewController: UITableViewDelegate, UITableViewDataSource, NeedToDoViewControllerDelegate {
    func updateCell(label text: String) {
        tasks.append(text)
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
        cell.textFromCell.text = "\(indexPath.row+1). \(tasks[indexPath.row])"
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(longTapEdit(recognizer:)))
        let doubleTap = UISwipeGestureRecognizer(target: self, action: #selector(swipeTapEdit(recognizer:)))
        cell.contentView.addGestureRecognizer(longTap)
        cell.contentView.addGestureRecognizer(doubleTap)
        return cell
    }

    @objc func swipeTapEdit(recognizer: UISwipeGestureRecognizer) {
        let tapLocation = recognizer.location(in: self.needToDoTasks)
        if let tapIndexPath = self.needToDoTasks.indexPathForRow(at: tapLocation) {
            if let tappedCell = self.needToDoTasks.cellForRow(at: tapIndexPath) as? TasksCell {
                if !tappedCell.state {
                    tappedCell.contentView.backgroundColor = .green
                    tappedCell.progressLine.isHidden = false
                } else {
                    tappedCell.contentView.backgroundColor = .white
                    tappedCell.progressLine.isHidden = true
                }
                tappedCell.state.toggle()
            }
        }
    }

    @objc func longTapEdit(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state != .began {return}
        let tapLocation = recognizer.location(in: self.needToDoTasks)
        if let tapIndexPath = self.needToDoTasks.indexPathForRow(at: tapLocation) {
            if let tappedCell = self.needToDoTasks.cellForRow(at: tapIndexPath) as? TasksCell {
                if !tappedCell.state {
                    tappedCell.contentView.backgroundColor = .red
                    tappedCell.progressLine.isHidden = true
                } else {
                    tappedCell.contentView.backgroundColor = .white
                    tappedCell.progressLine.isHidden = true
                }
                tappedCell.state.toggle()
            }
        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier:
         "EditCellViewController") as? EditCellViewController else {return}
        vc.editText = "\(tasks[indexPath.row])"
        vc.indexPath = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
}
