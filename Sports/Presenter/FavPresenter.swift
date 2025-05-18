//
//  FavPresenter.swift
//  Sports
//
//  Created by Macos on 17/05/2025.
//

import Foundation
class FavPresenter{
    let coreObj = MyCoreDataServices.shared
    
    func getDataFromModel()-> [LeagueCoreDataModel]{
        coreObj.getLeague()
        //       {  obj in
        //            print("recived********")}
        //    }
    }
}
