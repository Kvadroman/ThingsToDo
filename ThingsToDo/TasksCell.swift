//
//  TasksCell.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 01.10.2021.
//

import UIKit

class TasksCell: UITableViewCell {

    let cells = NeedToDoViewController()
    @IBOutlet weak var progressLine: UIProgressView!
    @IBOutlet weak var switchReminder: UISwitch!
    @IBOutlet weak var textFromCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        fontFace()
    }

    func fontFace() {
        textFromCell.font = UIFont(name: Settings.shared.fontFace ?? "",
                                   size: CGFloat(Settings.shared.sliderValue ?? 0.1))
    }

    @IBAction func switchAction(_ sender: UISwitch) {
    }

}
