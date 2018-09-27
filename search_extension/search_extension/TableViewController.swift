//
//  TableViewController.swift
//  search_extension
//
//  Created by 송동욱 on 26/09/2018.
//  Copyright © 2018 송동욱. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController , UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    

    //create the search controller and result contoller
    let data = ["One","Two","Three","Four","Five","Six","Seven"]
//    var filteredData = [String]()
    var searchController = UISearchController()
    var resultVC = UITableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchController = UISearchController(searchResultsController: resultVC)
        
        tableView.tableHeaderView = searchController.searchBar
        
        //if you want to make searchBar on navigation bar
//        navigationItem.searchController = searchController
//        navigationItem.hidesSearchBarWhenScrolling = true
        
        
        //usally good to set the presentation context  
        self.definesPresentationContext = true

//        self.searchController
        searchController.searchResultsUpdater = self

        searchController.searchBar.delegate = self
        
        searchController.delegate = self
        
        resultVC.tableView.delegate = self
        resultVC.tableView.dataSource = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    

}

class MyResultView : TableViewController{
    
}
