//
//  UITextfield Extension.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 28.08.2023.
//

import UIKit

enum TextFieldImageSide {
    case left
    case right
}

extension UITextField {
    func setUpImage(imageName: String, on side: TextFieldImageSide) {
        let imageView = UIImageView(frame: CGRect(x: 15, y: 0, width: 36, height: 36))
        if let imageWithSystemName = UIImage(systemName: imageName) {
            imageView.image = imageWithSystemName
        } else {
            imageView.image = UIImage(named: imageName)
        }
        
        let imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 65, height: 40))
        imageContainerView.addSubview(imageView)
        
        switch side {
        case .left:
            leftView = imageContainerView
            leftViewMode = .always
            self.tintColor = .lightGray
        case .right:
            rightView = imageContainerView
            rightViewMode = .always
            self.tintColor = .lightGray
        }
    }
}
