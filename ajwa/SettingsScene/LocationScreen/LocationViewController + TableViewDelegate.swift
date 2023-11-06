//
//  LocationViewController + TableViewDelegate.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 23.08.2023.
//

import UIKit

extension LocationViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        48
    }
    
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
            label.text = "Местоположение"
            label.font = AppFont.medium.s20()
            label.textColor = .black
            label.frame = CGRect(x: 0, y: 10, width: 200, height: 52)
            headerView.addSubview(label)
            return headerView }
        else { return UIView()}
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cornerRadius = 15
        var corners: UIRectCorner = []
        
        if indexPath.row == 0 {
            corners.update(with: .topLeft)
            corners.update(with: .topRight)
        }
        
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
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
        if let previouslySelectedIndexPath = previouslySelectedIndexPath {
            location[previouslySelectedIndexPath.section].isSelected = false
        }
        location[indexPath.section].isSelected = true
        previouslySelectedIndexPath = indexPath
        onLocationChange?(location[indexPath.section])
        tableView.reloadData()
//        dismiss(animated: true)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let interactor = interactor else { return }

        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height) && !interactor.isLoading) {
            interactor.getNextBatchOfCities()
        }
    }
}
