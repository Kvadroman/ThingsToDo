//
//  FontFaceTableView.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 17.10.2021.
//

import UIKit

extension FontFaceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontFace.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
                                "FontSizeCell", for: indexPath) as? FontFaceCell else {fatalError()}
        cell.fontFaceLabel.text = fontFace[indexPath.row]
        cell.fontFaceLabel.font = UIFont(name: fontFace[indexPath.row], size: CGFloat(Settings.shared
                                                                                        .sliderValue ?? 0.1))
        cell.fontFaceExampleLabel.font = cell.fontFaceLabel.font
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            Settings.shared.fontFace = fontFace[indexPath.row]
        self.fontFaceTableView.deselectRow(at: indexPath, animated: true)
        }
    }
