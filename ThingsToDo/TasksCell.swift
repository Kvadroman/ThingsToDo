//
//  TasksCell.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 01.10.2021.
//

import UIKit

class TasksCell: UITableViewCell {

    var state: Bool = false
    @IBOutlet weak var progressLine: UIProgressView!
    @IBOutlet weak var switchReminder: UISwitch!
    @IBOutlet weak var textFromCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(longTapEdit(recognizer:)))
        let doubleTap = UISwipeGestureRecognizer(target: self, action: #selector(swipeTapEdit(recognizer:)))
        contentView.addGestureRecognizer(longTap)
        contentView.addGestureRecognizer(doubleTap)
    }

    @objc func swipeTapEdit(recognizer: UISwipeGestureRecognizer) {
        if !state {
            contentView.backgroundColor = .green
            progressLine.isHidden = false
        } else {
            contentView.backgroundColor = .white
            progressLine.isHidden = true
        }
        state.toggle()
    }

    @objc func longTapEdit(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state != .began {return}
        if !state {
            contentView.backgroundColor = .red
            progressLine.isHidden = true
        } else {
            contentView.backgroundColor = .white
            progressLine.isHidden = true
        }
        state.toggle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
