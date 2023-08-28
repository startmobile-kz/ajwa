//
//  LocationViewController + Tav.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 23.08.2023.
//

import UIKit

extension LocationViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        48
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let section = location[section]
        
        if section.isExpanded {
            return section.locationList.states.count
        } else {
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        location.count  }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = location[indexPath.section].locationList
        
       
        
        switch model.self {
        case is Country:
            let cell: CountryCell = tableView.dequeueReusableCell()
            cell.locationLabel.text = location[indexPath.section].locationList.states[indexPath.row]
            if location[indexPath.section].isExpanded {
                cell.disclosureImageView.image = UIImage(named: "")
            } else {
                cell.disclosureImageView.image = AppImage.expand.uiImage
            }
            return cell
            
        case is City:
            let cell: CityCell = tableView.dequeueReusableCell()
            cell.locationLabel.text = location[indexPath.section].locationList.states[indexPath.row]
            cell.utcTimeLabel.text = "UTC +6:00"
            if location[indexPath.section].isExpanded {
                cell.disclosureImageView.image = UIImage(named: "")
            } else {
                cell.disclosureImageView.image = AppImage.expand.uiImage
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}
