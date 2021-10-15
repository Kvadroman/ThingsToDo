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
        cell.textFromLabelCell?.text = settingsArray[indexPath.row]
        cell.imageViewSettingCell.image = UIImage(systemName: settingsCell[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath {
        case [0, 0]:
            let vc = storyboard?.instantiateViewController(withIdentifier:
            "ColorThemeViewController") as? ColorThemeViewController ?? UIViewController()
                self.present(vc, animated: true, completion: nil)
        case [0, 1]:
            let vc = storyboard?.instantiateViewController(withIdentifier:
                "FontFaceViewController") as? FontFaceViewController ?? UIViewController()
                    self.present(vc, animated: true, completion: nil)
        case [0, 2]:
            let vc = storyboard?.instantiateViewController(withIdentifier:
                "FontSizeViewController") as? FontSizeViewController ?? UIViewController()
                    self.present(vc, animated: true, completion: nil)
        case [0, 3]:
            let vc = storyboard?.instantiateViewController(withIdentifier:
                "ChangeAppIconViewController") as? ChangeAppIconViewController ?? UIViewController()
                    self.present(vc, animated: true, completion: nil)
        default:
            return
        }
}
}
