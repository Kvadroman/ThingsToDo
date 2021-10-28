//
//  UserDefaults.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 24.10.2021.
//

import UIKit

final class Settings {
    static let shared = Settings()
    private let defaults = UserDefaults.standard
    private init() {}
    var appTheme: UIUserInterfaceStyle? {
        get {
            return UIUserInterfaceStyle(rawValue: defaults.integer(forKey: "appTheme"))
        }
        set {
            defaults.set(newValue?.rawValue, forKey: "appTheme")
        }
    }
    var fontSize: Bool? {
        get {
            return defaults.bool(forKey: "fontSize")
        }
        set {
            defaults.setValue(newValue, forKey: "fontSize")
        }
    }

    var sliderValue: Float? {
        get {
            return defaults.float(forKey: "sliderValue")
        }
        set {
            defaults.setValue(newValue, forKey: "sliderValue")
        }
    }

    var fontFace: String? {
        get {
            return defaults.string(forKey: "fontFace")
        }
        set {
            defaults.setValue(newValue, forKey: "fontFace")
        }
    }
}
