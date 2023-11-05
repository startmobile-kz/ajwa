//
//  LocationViewController + Tav.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 23.08.2023.
//

import UIKit

extension LocationViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if location.count > 141 {
            print("FAIL - \(location.count)")
        }
        return location.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = location[indexPath.section]
        let cell: CityCell = tableView.dequeueReusableCell()
        cell.configure(with: model)
        cell.selectionStyle = .none
        cell.layer.cornerRadius = 26
        cell.clipsToBounds = true
        return cell
    }
}
