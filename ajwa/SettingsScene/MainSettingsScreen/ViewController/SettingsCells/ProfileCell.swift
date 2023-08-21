//
//  ProfileCell.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 15.08.2023.
//

import UIKit
import SnapKit

protocol SettingsCell {
    
}

final class ProfileCell: UITableViewCell {
    
    static let identifier = "ProfileCell"
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = AppColor.lightgreen.uiColor
        return view
    }()
    
    private let iconLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.medium.s24()
        label.textColor = AppColor.darkgreen.uiColor
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.medium.s16()
        return label
    }()
    
    private let userMobileNumberLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.medium.s12()
        label.textColor = .gray
        return label
    }()
    
    private let userInformationStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private let editButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = AppColor.blue.uiColor
        button.layer.cornerRadius = 20
        let buttonImage = AppImage.modify.uiImage?.withTintColor(.white).withRenderingMode(.alwaysOriginal)
        button.setImage(buttonImage, for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with model: ProfileCellSettings) {
        userNameLabel.text = model.name
        iconLabel.text = model.initials
        userMobileNumberLabel.text = model.phoneNumber
    }
    
    private func setupHierarchy() {
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconLabel)
        contentView.addSubview(userInformationStack)
        userInformationStack.addArrangedSubview(userNameLabel)
        userInformationStack.addArrangedSubview(userMobileNumberLabel)
        contentView.addSubview(editButton)
        contentView.clipsToBounds = true
    }
    
    private func setupLayout() {
        iconContainer.snp.makeConstraints {make in
            make.leading.equalToSuperview().offset(12)
            make.height.equalTo(52)
            make.width.equalTo(52)
            make.centerY.equalToSuperview()
        }
        
        iconLabel.snp.makeConstraints {make in
            make.center.equalToSuperview()
        }
        
        userInformationStack.snp.makeConstraints {make in
            make.leading.equalTo(iconContainer.snp.trailing).offset(12)
            make.centerY.equalToSuperview()
            make.height.equalTo(52)
        }
        
        editButton.snp.makeConstraints{make in
            make.trailing.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(40)
        }
    }
}


