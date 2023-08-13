//
//  Extension.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 10.08.2023.
//

import UIKit

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = settings[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .profileCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ProfileCell.identifier,
                for: indexPath
            ) as? ProfileCell else {return UITableViewCell()}
            cell.configure(with: model)
            cell.selectionStyle = .none
            return cell
            
        case .shareAndRateCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ShareAndRateCell.identifier,
                for: indexPath
            ) as? ShareAndRateCell else {return UITableViewCell()}
            cell.configure(with: model)
            cell.selectionStyle = .none
            return cell
        
        case .headerCell(let header):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: HeaderCell.identifier,
                for: indexPath
            ) as? HeaderCell else {return UITableViewCell()}
            cell.configure(with: header)
            cell.selectionStyle = .none
            return cell
            
        case .footerCell(let footer):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: FooterCell.identifier,
                for: indexPath
            ) as? FooterCell else {return UITableViewCell()}
            cell.configure(with: footer)
            cell.selectionStyle = .none
            return cell
                    
        case .locationCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: LocationCell.identifier,
                for: indexPath
            ) as? LocationCell else {return UITableViewCell()}
            cell.configure(with: model)
            cell.selectionStyle = .none
            return cell
            
        case .prayTimeCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PrayTimeCell.identifier,
                for: indexPath
            ) as? PrayTimeCell else {return UITableViewCell()}
            cell.configure(with: model)
            cell.selectionStyle = .none
            return cell
      
        case .languageCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: LanguageCell.identifier,
                for: indexPath
            ) as? LanguageCell else {return UITableViewCell()}
            cell.configure(with: model)
            cell.selectionStyle = .none
            return cell
            
        case .fontSizeCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: FontSizeCell.identifier,
                for: indexPath
            ) as? FontSizeCell else {return UITableViewCell()}
            cell.configure(with: model)
            cell.selectionStyle = .none
            return cell
            
        case .notificationAndSoundCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: NotificationAndSoundCell.identifier,
                for: indexPath
            ) as? NotificationAndSoundCell else {return UITableViewCell()}
            cell.configure(with: model)
            cell.selectionStyle = .none
            return cell
                        
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
//        let type = settings[indexPath.section].options[indexPath.row]
//        viewController.model = settings[indexPath.section].options[indexPath.row]
//
//        switch type {
//        case .regularCell(let model):
//            navigationController?.pushViewController(viewController, animated: true)
//            viewController.fillSettings(with: model.title)
////        case .switchCell(_):
//            print("nothing happens")
//        case .statusCell(let model):
//            navigationController?.pushViewController(viewController, animated: true)
//            viewController.fillSettings(with: model.title)
        }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let model = settings[indexPath.section].options[indexPath.row]
        switch model.self {
        case .headerCell:
            return 50
        case .footerCell:
            return 48
        case .profileCell(_):
            return 76
        case .locationCell(_):
            return 60
        case .shareAndRateCell(_):
            return 54
        case .prayTimeCell(_):
            return 60
        case .languageCell(_):
            return 60
        case .fontSizeCell(_):
            return 60
        case .notificationAndSoundCell(_):
            return 60
        }
    }

}

