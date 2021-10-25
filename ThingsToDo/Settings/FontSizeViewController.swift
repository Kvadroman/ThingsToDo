//
//  FontSizeViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 13.10.2021.
//

import UIKit

class FontSizeViewController: UIViewController {

    @IBOutlet weak var sizeSwitch: UISwitch!
    @IBOutlet weak var sizeSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Font Size"
        if Settings.shared.fontSize == true {
            sizeSwitch.isOn = true
            sizeSlider.isUserInteractionEnabled = true
            sizeSlider.alpha = 1
        } else {
            sizeSwitch.isOn = false
            sizeSlider.isUserInteractionEnabled = false
            sizeSlider.alpha = 0.5
        }

    }
    @IBAction func enableFontSize(_ sender: UISwitch) {
        if sender.isOn {
            sizeSlider.isUserInteractionEnabled = true
            sizeSlider.alpha = 1
            Settings.shared.fontSize = true
        } else {
            sizeSlider.isUserInteractionEnabled = false
            sizeSlider.alpha = 0.5
            Settings.shared.fontSize = false
        }
    }
}
