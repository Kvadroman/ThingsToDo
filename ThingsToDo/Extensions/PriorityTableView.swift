//
//  PriorityViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 05.10.2021.
//

import UIKit

extension PriorityViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return priorityTasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PriorityCell",
                            for: indexPath) as? PriorityCell else {fatalError()}
        cell.textLabel?.text = priorityTasks[indexPath.row]
        return cell
    }
    }
