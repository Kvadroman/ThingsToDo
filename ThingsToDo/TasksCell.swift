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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        }
    }
