//
//  SettingsTableView.swift
//  ThingsToDo
//
//  Created by Ивченко Антон on 04.10.2021.
//

import UIKit
import MessageUI
import SafariServices

extension SettingsViewController: UITableViewDataSource,
        UITableViewDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell") as? SettingsCell else {fatalError()}
        cell.textFromLabelCell?.text = settingsArray[indexPath.row]
        cell.imageViewSettingCell.image = UIImage(systemName: settingsImageCell[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath {
        case [0, 0]:
            guard let vc = storyboard?.instantiateViewController(
                withIdentifier: "ColorThemeViewController") as? ColorThemeViewController else {return}
            navigationController?.pushViewController(vc, animated: true)
        case [0, 1]:
            guard let vc = storyboard?.instantiateViewController(
                withIdentifier: "FontFaceViewController") as? FontFaceViewController else {return}
            navigationController?.pushViewController(vc, animated: true)
        case [0, 2]:
            guard let vc = storyboard?.instantiateViewController(
                withIdentifier: "FontSizeViewController") as? FontSizeViewController else {return}
            navigationController?.pushViewController(vc, animated: true)
        case [0, 3]:
            guard let vc = storyboard?.instantiateViewController(
                withIdentifier: "ChangeAppIconViewController") as? ChangeAppIconViewController else {return}
            navigationController?.pushViewController(vc, animated: true)
        case [0, 4]:
            mailSending()
        default:
            return
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            return controller.dismiss(animated: true, completion: nil)
        }
        controller.dismiss(animated: true, completion: nil)
    }

    func mailSending() {
        if MFMailComposeViewController.canSendMail() {
            let vc = MFMailComposeViewController()
            vc.mailComposeDelegate = self
            vc.setSubject("Contact us / Feedback")
            vc.setToRecipients(["kvadrostoplerman@gmail.com"])
            vc.setSubject("Contact/Feedback")
            vc.setMessageBody("<h1>I have a question about you app.</h1>", isHTML: true)
            present(vc, animated: true)
        } else {
            guard let url = URL(string: "http://www.google.com") else {return}
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        }
    }
}
