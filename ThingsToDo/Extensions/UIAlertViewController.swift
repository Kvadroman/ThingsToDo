//
//  UIAlertViewController.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 30.09.2021.
//

import UIKit

extension UIViewController {
    func showAlert(msg: String, inViewController vc: UIViewController,
                   actions: [UIAlertAction]? = nil, type: UIAlertController.Style = .alert, title: String) {
        let alertType: UIAlertController.Style = .alert
        let alertTitle = title
        let alertVC = UIAlertController(title: alertTitle, message: msg, preferredStyle: alertType)
        if let actions = actions {
            for action in actions {
                alertVC.addAction(action)
            }
        } else {
            let actionCancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertVC.addAction(actionCancel)
        }
        vc.present(alertVC, animated: true, completion: nil)
    }
}
