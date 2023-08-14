//
//  SettingsViewController + UITableViewDataSource.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 14.08.2023.
//

import UIKit

extension SettingsViewController: UITableViewDataSource {
    
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
            let cell: ProfileCell = tableView.dequeueReusableCell()
            cell.configure(with: model)
            cell.selectionStyle = .none
            return cell

        case .shareAndRateCell(let model):
            let cell: ShareAndRateCell = tableView.dequeueReusableCell()
            cell.configure(with: model)
            cell.selectionStyle = .none
            return cell

        case .headerCell(let header):
            let cell: HeaderCell = tableView.dequeueReusableCell()
            cell.configure(with: header)
            cell.selectionStyle = .none
            return cell

        case .footerCell(let footer):
            let cell: FooterCell = tableView.dequeueReusableCell()
            cell.configure(with: footer)
            cell.selectionStyle = .none
            return cell

        case .locationCell(let model):
            let cell: LocationCell = tableView.dequeueReusableCell()
            cell.configure(with: model)
            cell.selectionStyle = .none
            return cell

        case .prayTimeCell(let model):
            let cell: PrayTimeCell = tableView.dequeueReusableCell()
            cell.configure(with: model)
            cell.selectionStyle = .none
            return cell

        case .languageCell(let model):
            let cell: LanguageCell = tableView.dequeueReusableCell()
            cell.configure(with: model)
            cell.selectionStyle = .none
            return cell

        case .fontSizeCell(let model):
            let cell: FontSizeCell = tableView.dequeueReusableCell()
            cell.configure(with: model)
            cell.selectionStyle = .none
            return cell

        case .notificationAndSoundCell(let model):
            let cell: NotificationAndSoundCell = tableView.dequeueReusableCell()
            cell.configure(with: model)
            cell.selectionStyle = .none
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        settings[indexPath.section].options[indexPath.row].height
    }
}
