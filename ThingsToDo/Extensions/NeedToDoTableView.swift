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
        return cell
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
        navigationController?.pushViewController(vc, animated: true)
    }
}
