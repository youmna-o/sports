//
//  LeagueCoreDataModel+CoreDataProperties.swift
//  Sports
//
//  Created by Macos on 21/05/2025.
//
//

import Foundation
import CoreData


extension LeagueCoreDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LeagueCoreDataModel> {
        return NSFetchRequest<LeagueCoreDataModel>(entityName: "LeagueCoreDataModel")
    }

    @NSManaged public var imageUrl: String?
    @NSManaged public var key: String?
    @NSManaged public var name: String?
    @NSManaged public var sportType: String?

}

extension LeagueCoreDataModel : Identifiable {

}
