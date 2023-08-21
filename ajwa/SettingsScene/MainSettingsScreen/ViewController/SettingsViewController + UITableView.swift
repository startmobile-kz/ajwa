//
//  SettingsViewController + UITableView.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 15.08.2023.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}

