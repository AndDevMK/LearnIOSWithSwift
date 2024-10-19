//
//  UserEntity+CoreDataProperties.swift
//  UseCoreData
//
//  Created by 彭明健 on 2024/10/19.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var age: Int16
    @NSManaged public var houseId: Int64
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var monitor: HouseEntity?

}

extension UserEntity : Identifiable {

}
