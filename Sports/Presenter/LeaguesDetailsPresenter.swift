//
//  LeaguesDetailsPresenter.swift
//  Sports
//
//  Created by Macos on 15/05/2025.
//

import Foundation
class LeaguesDetailsPresenter{
   weak var myCollection : DetailsCollectionViewController!
    func attachTableView(collectionView: DetailsCollectionViewController){
        myCollection = collectionView
    }
    func getDataFromModel(sportType: String, leaguesKey: String) {
        NetworkService.fetchLeaguesDetails(sportType: sportType, leaguesKey: leaguesKey) { [weak self] res in
            DispatchQueue.main.async {
                guard let result = res else {
                    print(" No data returned from API.")
                    return
                }
                self?.myCollection?.renderToView(result: result)
            }
        }
    }

}
