//
//  NewTaskViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 28.09.2021.
//

import UIKit

class NewTaskViewController: UIViewController {

    
    @IBOutlet weak var prioritySwitch: UISwitch!
    @IBOutlet weak var backButton: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prioritySwitch.tintColor = prioritySwitch.isOn ? UIColor.red : UIColor.blue
}
}

