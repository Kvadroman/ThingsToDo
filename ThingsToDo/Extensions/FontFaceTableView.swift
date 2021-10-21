//
//  FontFaceTableView.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 17.10.2021.
//

import UIKit

extension FontFaceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
