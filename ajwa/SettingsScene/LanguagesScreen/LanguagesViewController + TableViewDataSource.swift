//
//  LanguagesViewController + DataSource.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 18.08.2023.
//

import UIKit

extension LanguagesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1   }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        languages.count
        }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        48
    }
//
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
                    return 60
                } else {
                    return 0
                }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = UIView.init(frame: CGRect.init(x: 5, y: 5, width: 200, height: 50))
            headerView.backgroundColor = .clear
            let label = UILabel()
            label.text = "Язык"
            label.font = AppFont.medium.s20()
            label.textColor = .black
            label.frame = CGRect(x: 0, y: 10, width: 200, height: 52)
            headerView.addSubview(label)
            return headerView }
        else { return UIView()}
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        if section == 2 {
            let footerView = UIView()
            footerView.backgroundColor = .clear
            footerView.frame = CGRect(x: 0, y: 0, width: 326, height:
                                    60)
            let button = UIButton()
            button.frame = CGRect(x: 0, y: 10, width: 354, height: 52)
            button.layer.cornerRadius = 12
            button.setTitle("Сохранить", for: .normal)
            button.titleLabel?.font = AppFont.semibold.s16()
            button.backgroundColor = AppColor.blue.uiColor
            footerView.addSubview(button)
            return footerView }
        else { return UIView()}
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let cornerRadius = 15
        var corners: UIRectCorner = []

        if indexPath.row == 0
        {
            corners.update(with: .topLeft)
            corners.update(with: .topRight)
        }

        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1
        {
            corners.update(with: .bottomLeft)
            corners.update(with: .bottomRight)
        }

        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: cell.bounds,
                                      byRoundingCorners: corners,
                                      cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
        cell.layer.mask = maskLayer
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let cell = tableView.cellForRow(at: indexPath) as! LanguageTypeCell
            cell.updateCheckState(true)
        }
        
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! LanguageTypeCell
        cell.updateCheckState(false)}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = languages[indexPath.section]
        let cell: LanguageTypeCell = tableView.dequeueReusableCell()
        cell.configure(with: model)
        cell.selectionStyle = .none
        cell.layer.cornerRadius = 26
        cell.clipsToBounds = true
        cell.updateCheckState(false)
        return cell
        
    }
    }

