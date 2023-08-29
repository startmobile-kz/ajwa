//
//  NamazController + UITableViewDelegate.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 28.08.2023.
//

//import UIKit
//
//extension NamazViewController: UITableViewDelegate {
//
//
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0 {
//            return 72
//        } else {
//            return 0
//        }
//    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
//        
//        
//        if section == 0 {
//            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width:tableView.frame.size.width, height: 52))
//            let textField = UITextField(frame: CGRect(x: 0, y: 0, width:tableView.frame.size.width/16.0 * 14.5, height: 52))
//            textField.placeholder = "Поиск"
//            textField.backgroundColor = AppColor.white.uiColor
//            let padding = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//            textField.leftView = padding
//            textField.leftViewMode = .always
//            let imageView = UIImageView(frame: CGRect(x: 10, y: 0, width: 36, height: 36))
//            imageView.backgroundColor = AppColor.blue.uiColor
//            imageView.layer.cornerRadius = 12
//            let imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 36))
//            imageContainerView.addSubview(imageView)
//            imageView.contentMode = .redraw
//            imageView.image = AppImage.search.uiImage
//            textField.rightView = imageContainerView
//            textField.rightViewMode = .always
////            textField.delegate = self
//            textField.layer.cornerRadius = 16
//            textField.layer.borderColor = UIColor.white.cgColor
//            textField.addTarget(self, action: #selector(NamazViewController.searchControl(_:)), for: .editingChanged)
////            textField.addTarget(textField, action: (searchControl(textField)), for: .editingChanged)
////            textField.addTarget(self, action: #selector(searchControl()), for: .editingChanged)
//            
//        
//            
//            
//            
////       
//            headerView.addSubview(textField)
//            return headerView
//        }
        
//        else {
//            return UIView()
//        }
//    }
//}
//
