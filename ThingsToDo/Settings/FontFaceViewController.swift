//
//  FontFaceViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 13.10.2021.
//

import UIKit

class FontFaceViewController: UIViewController {

    let fontFace: [String] = ["Arial", "Marker Felt", "Cochin", "Times New Roman", "Snel RoundHand"]
    let fontFaceExamble: [String] = []
    let fontFont: [UIFont] = []
    @IBOutlet weak var fontFaceTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Font Face"
        fontFaceTableView.delegate = self
        fontFaceTableView.dataSource = self
    }
}
