//
//  UIView+Extension.swift
//  ajwa
//
//  Created by Kuanysh al-Khattab Auyelgazy on 07.10.2023.
//

import UIKit

extension UIView {
    /// Add multiple subviews
    /// - Parameter views: Variadic views
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
