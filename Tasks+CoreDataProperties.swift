//
//  Tasks+CoreDataProperties.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 09.10.2021.
//
//

import Foundation
import CoreData

extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var title: String?
    @NSManaged public var strikethrought: Bool
    @NSManaged public var colorCell: String?

}

extension Tasks: Identifiable {

}
