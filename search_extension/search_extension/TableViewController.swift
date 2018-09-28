//
//  TableViewController.swift
//  search_extension
//
//  Created by 송동욱 on 26/09/2018.
//  Copyright © 2018 송동욱. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController , UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate{
   
    var scopedData = [Data]()
    var fileteredData = [Data]()
    
    var searchController = UISearchController()
    var resultVC = UITableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        
        searchController = UISearchController(searchResultsController: resultVC)
        tableView.tableHeaderView = searchController.searchBar
        //usally good to set the presentation context  
        self.definesPresentationContext = true

        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.delegate = self
        
        resultVC.tableView.delegate = self
        resultVC.tableView.dataSource = self
        //scope
        searchController.searchBar.scopeButtonTitles = ["All","A","B"]
    }

    func updateSearchResults(for searchController: UISearchController) {
//        fileteredData = scopedData.filter({ (scopedData:Data) -> Bool in
//            return scopedData.main.lowercased().contains(searchController.searchBar.text!.lowercased())
//        })
//        resultVC.tableView.reloadData()
//        print(fileteredData.count)
        fileteredData = scopedData.filter({ (scopedData:Data) -> Bool in
            let scope = searchController.searchBar.scopeButtonTitles![searchController.searchBar.selectedScopeButtonIndex]
            if scope == "ALL"{ return true }
            return scopedData.main.lowercased().contains(searchController.searchBar.text!.lowercased()) && scopedData.detail.rawValue == scope
        })
        resultVC.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        fileteredData = scopedData.filter({ (scopedData:Data) -> Bool in
            let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
            if scope == "ALL"{ return true }
            return scopedData.main.lowercased().contains(searchController.searchBar.text!.lowercased()) && scopedData.detail.rawValue == scope
        })
        resultVC.tableView.reloadData()
        
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == resultVC.tableView ? fileteredData.count : scopedData.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
       
        cell.textLabel?.text = (tableView == resultVC.tableView ? fileteredData[indexPath.row].main : scopedData[indexPath.row].main)
        cell.detailTextLabel?.text = (tableView == resultVC.tableView ? fileteredData[indexPath.row].detail : scopedData[indexPath.row].detail).rawValue
        return cell
    }
    
    private func setData(){
        scopedData.append(Data(main: "One", detail: .A))
        scopedData.append(Data(main: "Two", detail: .A))
        scopedData.append(Data(main: "Three", detail: .A))
        scopedData.append(Data(main: "Ten", detail: .B))
        scopedData.append(Data(main: "Eleven", detail: .B))
        scopedData.append(Data(main: "Twelve", detail: .B))
    }
    

}

