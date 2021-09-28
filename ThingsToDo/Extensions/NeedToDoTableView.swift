//
//  NeedToDoTableViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 27.09.2021.
//

import UIKit

extension NeedToDoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tasksCell", for: indexPath) as! TasksCell
        switch indexPath.row {
        case 0: cell.backgroundColor = .red
        case 1: cell.backgroundColor = .green
        default: cell.backgroundColor = .white
        }
        return cell
    }
    
    
}
