//
//  ChangeAppIconTableView.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 17.10.2021.
//

import UIKit

extension ChangeAppIconViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return changeAppIconTextArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
                    "ChangeAppIconCell") as? ChangeAppIconCell else {fatalError()}
        cell.changeAppIconCellLabel.text = changeAppIconTextArray[indexPath.row]
        cell.changeAppIconCellImageView.image = UIImage(named: changeAppIconImageArray[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath {
        case [0, 0]:
            changeAppIcon(name: "rabit")
        case [0, 1]:
            changeAppIcon(name: "default")
        default:
            return
        }
    }

    func changeAppIcon(name: String?) {
        guard UIApplication.shared.supportsAlternateIcons else {return}
        UIApplication.shared.setAlternateIconName(name) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }
    }
}
