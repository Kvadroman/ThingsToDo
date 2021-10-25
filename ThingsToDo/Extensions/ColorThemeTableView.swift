//
//  ColorThemeTableView.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 17.10.2021.
//

import UIKit

extension ColorThemeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorImageArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorThemeCell") as? ColorThemeCell
                                                                                        else {fatalError()}
        cell.colorThemeCellLabel.text = colorTitleArray[indexPath.row]
        cell.colorThemeCellImageView.image = UIImage(systemName: colorImageArray[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath {
        case [0, 0]:
            tabBarController?.overrideUserInterfaceStyle = .light
            Settings.shared.appTheme = .light
        case [0, 1]:
            tabBarController?.overrideUserInterfaceStyle = .dark
            Settings.shared.appTheme = .dark
        default:
        return
        }
    }
}
