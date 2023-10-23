//
//  TopView.swift
//  ajwa
//
//  Created by Adlet Zhantassov on 28.08.2023.
//

import UIKit

class TopView: UIView {
    
    var data = ["Январь", "Февраль", "Март","Апрель","Май","Июнь","Июль","Август","Сентябрь","Октябрь","Ноябрь","Декабрь"]
    var index = 5
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = data[index]
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    lazy var leftArrowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppImage.leftArrow.uiImage, for: .normal)
        button.addTarget(nil, action: Selector(("leftArrowButtonPressed")), for: .touchUpInside)
        return button
    }()
    
    lazy var rightArrowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppImage.rightArrow.uiImage, for: .normal)
        button.addTarget(nil, action: Selector(("leftArrowButtonPressed")), for: .touchUpInside)
        return button
    }()
    
//    @objc func leftArrowButtonPressed() {
//        if index > 0 {
//            index -= 1
//            label.text = data[index]
//        }
//        print("left arrow \(index)")
//        
//    }
//    
//    @objc func rightArrowButtonPressed() {
//        if index < (data.count - 1) {
//            index += 1
//            label.text = data[index]
//        }
//        print("right arrow \(index)")
//    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        addSubview(leftArrowButton)
        addSubview(rightArrowButton)
        backgroundColor = .white
        layer.cornerRadius = 15
        
        leftArrowButton.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading).offset(10)
            make.centerY.equalTo(snp.centerY)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.centerY.equalTo(snp.centerY)
        }
        
        rightArrowButton.snp.makeConstraints { make in
            make.trailing.equalTo(snp.trailing).offset(-10)
            make.centerY.equalTo(snp.centerY)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
