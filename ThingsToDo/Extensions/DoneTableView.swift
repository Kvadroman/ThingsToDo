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
}
