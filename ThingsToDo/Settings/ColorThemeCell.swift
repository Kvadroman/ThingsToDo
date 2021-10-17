//
//  ColorThemeCell.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 17.10.2021.
//

import UIKit

class ColorThemeCell: UITableViewCell {

    @IBOutlet weak var colorThemeCellImageView: UIImageView!
    @IBOutlet weak var colorThemeCellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
