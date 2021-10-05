//
//  SettingsTableView.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 04.10.2021.
//

import UIKit

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell") as? SettingsCell else {fatalError()}
        cell.textLabel?.text = settingsArray[indexPath.row]
        print(settingsArray[indexPath.row])
        return cell
    }
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
