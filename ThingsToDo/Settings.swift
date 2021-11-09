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
    var fontSwitch: Bool? {
        get {
            return defaults.value(forKey: "fontSwitch") as? Bool ?? true
        }
        set {
            defaults.setValue(newValue, forKey: "fontSwitch")
        }
    }

    var sliderValue: Float? {
        get {
            return defaults.value(forKey: "sliderValue") as? Float ?? 20
        }
        set {
            defaults.setValue(newValue, forKey: "sliderValue")
        }
    }

    var fontFace: String? {
        get {
            return defaults.value(forKey: "fontFace") as? String ?? "Arial"
        }
        set {
            defaults.setValue(newValue, forKey: "fontFace")
        }
    }
}
