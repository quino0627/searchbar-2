//
//  TableViewController.swift
//  search_extension
//
//  Created by 송동욱 on 26/09/2018.
//  Copyright © 2018 송동욱. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController , UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate{
   
    

    //create the search controller and result contoller
    var dataArray = [Data]()
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
    }

    func updateSearchResults(for searchController: UISearchController) {
        fileteredData = dataArray.filter({ (data:Data) -> Bool in
            return data.main.lowercased().contains(searchController.searchBar.text!.lowercased())
        })
        resultVC.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == resultVC.tableView ? fileteredData.count : dataArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = (tableView == resultVC.tableView ? fileteredData[indexPath.row].main : dataArray[indexPath.row].main)
        return cell
    }
    
    private func setData(){
        dataArray.append(Data(main: "One", detail: .A))
        dataArray.append(Data(main: "Two", detail: .A))
        dataArray.append(Data(main: "Three", detail: .A))
        dataArray.append(Data(main: "Ten", detail: .B))
        dataArray.append(Data(main: "Eleven", detail: .B))
        dataArray.append(Data(main: "Twelve", detail: .B))
    }

}

