//
//  FontFaceViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 13.10.2021.
//

import UIKit

class FontFaceViewController: UIViewController {

    @IBOutlet weak var fontFaceTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Font Face"
        fontFaceTableView.delegate = self
        fontFaceTableView.dataSource = self

    }
}
