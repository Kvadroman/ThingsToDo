//
//  TasksCell.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 01.10.2021.
//

import UIKit

class TasksCell: UITableViewCell {

    var switchAction: ((Any) -> Void)?
    @IBOutlet weak var progressLine: UIProgressView!
    @IBOutlet weak var switchReminder: UISwitch!
    @IBOutlet weak var textFromCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func fontFace() {
        textFromCell.font = UIFont(name: Settings.shared.fontFace ?? "",
                                   size: CGFloat(Settings.shared.sliderValue ?? 0.1))
    }

// MARK: Action that save the value switch to CoreData
    @IBAction func switchAction(_ sender: UISwitch) {
        self.switchAction?(sender)
    }
}
