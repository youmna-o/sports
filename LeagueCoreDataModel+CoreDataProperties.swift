//
//  LeagueCoreDataModel+CoreDataProperties.swift
//  Sports
//
//  Created by Macos on 17/05/2025.
//
//

import Foundation
import CoreData


extension LeagueCoreDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LeagueCoreDataModel> {
        return NSFetchRequest<LeagueCoreDataModel>(entityName: "LeagueCoreDataModel")
    }

    @NSManaged public var name: String?
    @NSManaged public var imageUrl: String?

}

extension LeagueCoreDataModel : Identifiable {

}
