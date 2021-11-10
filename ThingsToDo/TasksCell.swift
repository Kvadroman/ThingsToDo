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
        textFromCell.font = UIFont(name: Settings.shared.fontFace ?? "Arial",
                                   size: CGFloat(Settings.shared.sliderValue ?? 20))
    }

    func backgroundColorCellUserInterfaceStyle() {
        if self.traitCollection.userInterfaceStyle == .dark {
            contentView.backgroundColor = .black
        } else {
            contentView.backgroundColor = .white
        }
    }

    func backgroundColorCellGesture(array: [Tasks], indexPath: Int) {
        if array[indexPath].gestureSwipeType == true {
            contentView.backgroundColor = .green
            progressLine.isHidden = false
        } else if array[indexPath].gestureLongType == true {
            contentView.backgroundColor = .red
            progressLine.isHidden = true
        } else {
            progressLine.isHidden = true
        }
    }

    // MARK: Action that save the value switch to CoreData
    @IBAction func switchAction(_ sender: UISwitch) {
        self.switchAction?(sender)
    }
}
