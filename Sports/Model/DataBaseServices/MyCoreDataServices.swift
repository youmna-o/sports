//
//  MyCoreData.swift
//  Sports
//
//  Created by Macos on 17/05/2025.
//

import Foundation
import CoreData
import UIKit

class MyCoreDataServices{
    var context : NSManagedObjectContext!
    var entity : NSEntityDescription!
    
    static let shared = MyCoreDataServices()
    
    private init() {
        let appDeleget = UIApplication.shared.delegate as! AppDelegate
        context = appDeleget.persistentContainer.viewContext
        entity=NSEntityDescription.entity(forEntityName: "LeagueCoreDataModel", in: context)
    }
    
    func addLeague(name: String, image: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LeagueCoreDataModel")
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.isEmpty {
                let leagueCoreDataModel = NSManagedObject(entity: entity, insertInto: context)
                leagueCoreDataModel.setValue(name, forKey: "name")
                leagueCoreDataModel.setValue(image, forKey: "imageUrl")
                
//                let league = LeagueCoreDataModel(entity: entity, insertInto: context)
//                                league.name = name
//                                league.imageUrl = image
                
                try context.save()
                print("League added: \(name)")
            } else {
                print(" League already exists: \(name)")
            }
        } catch let error {
            print(" Error adding league: \(error)")
        }
    }

    func getLeague() ->  [LeagueCoreDataModel] {
        var leagueArray: [LeagueCoreDataModel] = []

        let fetchReq = NSFetchRequest<LeagueCoreDataModel>(entityName: "LeagueCoreDataModel")
        do {
            let rsLeague = try context.fetch(fetchReq)
//            for league in rsLeague {
//                print(league.name ?? "No Name")
//                //Handler()
//            }
            return rsLeague
           
        } catch let error {
            print("Error: \(error)")
            return []
        }
    }
    

    
}
