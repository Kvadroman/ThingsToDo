//
//  NeedToDoTableViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 27.09.2021.
//

import UIKit

extension NeedToDoViewController: UITableViewDelegate, UITableViewDataSource, NeedToDoViewControllerDelegate {
    func updateCell(label text: String) {
        createTask(title: text)
//        tasks.append(text)
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
        cell.textFromCell.text = "\(indexPath.row+1). \(tasks[indexPath.row].title ?? "")"
        return cell
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
