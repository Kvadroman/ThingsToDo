//
//  CoreDataModel.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 09.11.2021.
//

import UIKit
import CoreData

class CoreDataService {

    static let shared: CoreDataService = {
        let instance = CoreDataService()
        return instance
    }()

    private init () {}

    lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var tasks = [Tasks]()

    func getAllTasks() {
        do {
            tasks = try context.fetch(Tasks.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
    }

    func createTask(date: String, title: String, priorityButton: Bool, doneButton: Bool, reminder: Bool, uuid: String) {
        let newTask = Tasks(context: context)
        newTask.date = date
        newTask.title = title
        newTask.gestureLongType = priorityButton
        newTask.gestureSwipeType = doneButton
        newTask.reminder = reminder
        newTask.uuid = uuid
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }

    func deleteTask(title: Tasks) {
        context.delete(title)
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }

    func updateTask(title: Tasks, newTitle: String) {
        title.title = newTitle
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }

    func saveTask() {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
