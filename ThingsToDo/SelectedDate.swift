//
//  SelectedDate.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 15.10.2021.
//

import Foundation

class SelectedDate {
    static let shared = SelectedDate()
    var selectedDate: String = ""
    private init () {}
}
