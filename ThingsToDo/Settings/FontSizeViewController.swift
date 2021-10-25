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
    @IBOutlet weak var exampleTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Font Size"
        sizeSlider.value = Settings.shared.sliderValue ?? 0.1
        exampleTextView.font = exampleTextView.font?.withSize(CGFloat(Int(sizeSlider.value)))
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
    @IBAction func sliderDidChangedAction(_ sender: UISlider) {
        exampleTextView.font = exampleTextView.font?.withSize(CGFloat(Int(sender.value)))
        Settings.shared.sliderValue = sender.value
    }
}
