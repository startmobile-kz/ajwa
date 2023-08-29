//
//  NamazContoller + UITableViewDataSource.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 28.08.2023.
//

import UIKit

extension NamazViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
1
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        filteredPrayers.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        79
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
    guard let cell = tableView.dequeueReusableCell(withIdentifier: NamazCell.identifier, for: indexPath) as? NamazCell else { return UITableViewCell() }
        
//        let model = prayers[indexPath.section]
        
        
            cell.configure(with: filteredPrayers[indexPath.section])
       
        return cell
        }
        
        
        
    }

