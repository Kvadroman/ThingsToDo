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
            if #available(iOS 13.0, *) {
                let window = UIApplication.shared.keyWindow
                window?.overrideUserInterfaceStyle = .light
                tabBarController?.overrideUserInterfaceStyle = .light
            }
        case [0, 1]:
            if #available(iOS 13.0, *) {
                let window = UIApplication.shared.keyWindow
                window?.overrideUserInterfaceStyle = .dark
                tabBarController?.overrideUserInterfaceStyle = .dark
            }
        default:
        return
        }
    }
}
