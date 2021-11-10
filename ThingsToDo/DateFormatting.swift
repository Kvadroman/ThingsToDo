//
//  DateFormatter.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 10.11.2021.
//

import Foundation

class DateFormatting {
    static let shared = DateFormatting()
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    private init () {}
}
