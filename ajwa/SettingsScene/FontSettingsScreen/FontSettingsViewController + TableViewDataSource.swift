//
//  FontSettingsViewController + TableViewDataSource.swift
//  ajwa
//
//  Created by Kuanysh al-Khattab Auyelgazy on 09.09.2023.
//

import UIKit

extension FontSettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        fonts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = fonts[indexPath.section]
        let cell: FontSettingsTypeCell = tableView.dequeueReusableCell()
        cell.configure(with: model)
        cell.selectionStyle = .none
        cell.layer.cornerRadius = 26
        cell.clipsToBounds = true
        return cell
    }
}
