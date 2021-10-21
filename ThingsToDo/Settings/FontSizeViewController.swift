//
//  FontSizeViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 13.10.2021.
//

import UIKit

class FontSizeViewController: UIViewController {

    static func storyboardInitiate() -> ChangeAppIconViewController? {
        let storyboard = UIStoryboard(name: "ChangeAppIconViewController", bundle: nil)
        return storyboard.instantiateInitialViewController() as? ChangeAppIconViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Font Size"
    }
  }
