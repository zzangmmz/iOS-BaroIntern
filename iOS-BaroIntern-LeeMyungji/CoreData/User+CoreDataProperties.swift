//
//  User+CoreDataProperties.swift
//  iOS-BaroIntern-LeeMyungji
//
//  Created by 이명지 on 3/16/25.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: String?
    @NSManaged public var password: String?
    @NSManaged public var nickname: String?

}

extension User : Identifiable {

}
