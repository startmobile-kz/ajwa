//
//  FooterCell.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 11.08.2023.
//

import UIKit
import SnapKit

final class FooterCell: UITableViewCell {
    static let identifier = "FooterCell"

    
    private let switchContainer: UIView = {
        let view = UIView()
//        view.layer.cornerRadius = 12
//        view.backgroundColor = buttonColor
        return view
    }()
    
    
    private let mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.onTintColor = .gray
        mySwitch.transform = CGAffineTransformMakeScale(0.50, 0.50);
        return mySwitch
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.textColor = .gray

        return label
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    public func configure(with model: SwitchCellSettings) {
        label.text = model.title
    }

    private func setupHierarchy() {
        
        contentView.addSubview(switchContainer)
        switchContainer.addSubview(mySwitch)
        switchContainer.addSubview(label)
        contentView.clipsToBounds = true
    }

    private func setupLayout() {
        
        switchContainer.snp.makeConstraints {make in
            make.leading.equalToSuperview()
            make.height.equalTo(24)
            make.width.equalTo(169)
            make.centerY.equalToSuperview()
        }
        
        
        mySwitch.snp.makeConstraints {make in
            make.leading.equalToSuperview()
//            make.height.equalTo(16)
//            make.width.equalTo(28)
            make.centerY.equalToSuperview()
        }


        label.snp.makeConstraints{ make in
            make.leading.equalTo(mySwitch.snp.trailing).offset(12)
            make.centerY.equalToSuperview()

        }
    }
}

