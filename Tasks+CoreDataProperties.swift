//
//  Tasks+CoreDataProperties.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 10.10.2021.
//
//

import Foundation
import CoreData

extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var title: String?
    @NSManaged public var gestureLongType: Bool
    @NSManaged public var gestureSwipeType: Bool

}

extension Tasks: Identifiable {

}
