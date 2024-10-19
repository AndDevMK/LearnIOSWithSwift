//
//  HouseEntity+CoreDataProperties.swift
//  UseCoreData
//
//  Created by 彭明健 on 2024/10/19.
//
//

import Foundation
import CoreData


extension HouseEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HouseEntity> {
        return NSFetchRequest<HouseEntity>(entityName: "HouseEntity")
    }

    @NSManaged public var house_type: String?
    @NSManaged public var id: Int64

}

extension HouseEntity : Identifiable {

}
