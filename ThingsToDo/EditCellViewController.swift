//
//  EditCellViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 03.10.2021.
//

import UIKit

class EditCellViewController: UIViewController {

    weak var delegate: NeedToDoViewControllerDelegate?
    var editText = ""
    @IBOutlet weak var editCellTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        editCellTextView.text = editText
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        editCellTextView.becomeFirstResponder()
    }
    @IBAction func saveEditingText(_ sender: UIBarButtonItem) {
        delegate?.updateCell(label: editCellTextView.text)
        self.navigationController?.popViewController(animated: true)
    }
}
