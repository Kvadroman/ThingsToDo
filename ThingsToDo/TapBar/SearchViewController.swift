//
//  SearchViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 04.10.2021.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tasksSearchBar: UISearchBar!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        tasksSearchBar.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchBar.becomeFirstResponder()
    }
}

extension SearchViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        print("1")
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("1")
    }
}
