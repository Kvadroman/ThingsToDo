//
//  FontFaceViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 13.10.2021.
//

import UIKit

class FontFaceViewController: UIViewController {

    static func storyboardInitiate() -> FontFaceViewController? {
        let storyboard = UIStoryboard(name: "FontFaceViewController", bundle: nil)
        return storyboard.instantiateInitialViewController() as? FontFaceViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
