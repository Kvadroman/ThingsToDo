//
//  SearchViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 04.10.2021.
//

import UIKit
import CoreData

class SearchViewController: UIViewController {

    private let searchController = UISearchController()
    var tasksSearch: [Tasks] = []
    @IBOutlet weak var searchTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.searchResultsUpdater = self
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(UINib(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "TasksCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchController.becomeFirstResponder()
        searchTableView.isHidden = true
    }

    func getAllData(from searchText: String) {
        CoreDataService.shared.fetchRequest.predicate = NSPredicate(format: "title contains %@", searchText)
        do {
            tasksSearch = try CoreDataService.shared.context.fetch(CoreDataService.shared.fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {return}
        getAllData(from: searchText)
        searchTableView.reloadData()
        searchTableView.isHidden = false
    }
}
