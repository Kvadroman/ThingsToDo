//
//  DoneTableView.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 10.10.2021.
//

import UIKit

extension DoneViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell",
                            for: indexPath) as? TasksCell else {fatalError()}
        cell.textFromCell.text = "\(indexPath.row+1). \(task.tasks[indexPath.row].title ?? "")"
        return cell
    }
}
