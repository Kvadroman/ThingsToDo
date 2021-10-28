//
//  SearchViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 04.10.2021.
//

import UIKit
import CoreData

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTableView: UITableView!
    let searchController = UISearchController()
    var task = NeedToDoViewController()
    var tasksSearch: [Tasks] = []
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
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title contains %@", searchText)
        do {
            tasksSearch = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        getAllData(from: text)
        searchTableView.reloadData()
        searchTableView.isHidden = false
    }
}
