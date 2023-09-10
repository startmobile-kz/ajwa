//
//  EditProfileViewController + UITextField.swift
//  ajwa
//
//  Created by Kuanysh al-Khattab Auyelgazy on 10.09.2023.
//

import UIKit

extension UITextField {
    func addPaddingToTextField() {
        let paddingView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
