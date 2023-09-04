//
//  LanguagesViewController + DataSource.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 18.08.2023.
//

import UIKit

extension LanguagesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = languages[indexPath.section]
        let cell: LanguageTypeCell = tableView.dequeueReusableCell()
        cell.configure(with: model)
        cell.selectionStyle = .none
        cell.layer.cornerRadius = 26
        cell.clipsToBounds = true
        return cell
    }
}
