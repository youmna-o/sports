//
//  LeaguesPresenter.swift
//  Sports
//
//  Created by Macos on 13/05/2025.
//

import Foundation
class LeaguesPresenter{
   weak var myTable : LeaguesTableViewController!
    func attachTableView(tableView: LeaguesTableViewController){
        myTable = tableView
    }
    func getDataFromModel(sportType: String) {
        NetworkService.fetchSports(sportType: sportType) { [weak self] res in
            DispatchQueue.main.async {
                guard let leagues = res else {
                    print("No leagues found for \(sportType)")
                    return
                }
                self?.myTable.renderToView(result: leagues) // Safe: `leagues` is non-optional
            }
        }
    }
}
