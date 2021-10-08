//
//  Tasks+CoreDataProperties.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 08.10.2021.
//
//

import Foundation
import CoreData

extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var title: String?

}

extension Tasks : Identifiable {
}
