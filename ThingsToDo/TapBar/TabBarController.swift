//
//  TabBarController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 04.10.2021.
//

import UIKit

class TabBarController: UITabBarController {

    @IBOutlet weak var tapBarButton: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = 1
    }
}
