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
    func getDataFromModel(sportType:String){
        NetworkService.fetchSports(sportType: sportType){[weak self] res in
            DispatchQueue.main.async {
                self?.myTable.renderToView(result : res!)

            }
        }
    }
}
