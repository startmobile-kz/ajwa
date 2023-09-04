//
//  SettingsViewController + TableViewDelegate.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 20.08.2023.
//

import UIKit

extension SettingsViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = settings[indexPath.section].options[indexPath.row]        
        
        switch type.self {
        case .headerCell:
            break
        case .footerCell:
            break
        case .profileCell:
            break
        case .locationCell:
            break
        case .shareAndRateCell:
            break
        case .prayTimeCell:
            break
        case .languageCell:
            let languagesViewController = LanguagesViewController()
            languagesViewController.modalPresentationStyle = .formSheet
            let sheet = languagesViewController.sheetPresentationController
            let fraction = UISheetPresentationController.Detent.custom { context in
                325
            }
            sheet?.detents = [fraction]
            navigationController?.present(languagesViewController, animated: true)
        case .fontSizeCell:
            break
        case .notificationAndSoundCell:
            break
        }
    }
}
