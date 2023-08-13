//
//  ProfileCell.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 10.08.2023.
//


import UIKit
import SnapKit


let iconContainerColor = UIColor(red: 231/255, green: 243/255, blue: 242/255, alpha: 1)
let iconLabelColor = UIColor(red: 62/255, green: 175/255, blue: 167/255, alpha: 1)
let buttonColor = UIColor(red: 0/255, green: 157/255, blue: 191/255, alpha: 1)


//background: rgba(0, 157, 191, 1);

//let color1 = CIC

class ProfileCell: UITableViewCell {
    
    static let identifier = "ProfileCell"
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = iconContainerColor
        return view
    }()
    
    private let iconLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(24)
        label.textColor = iconLabelColor
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(16)
        return label
    }()
    
    private let userMobileNumberLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
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
        button.backgroundColor = buttonColor
        button.layer.cornerRadius = 20
        let buttonImage = UIImage(named: "EditImage")?.withTintColor(.white).withRenderingMode(.alwaysOriginal)
        button.setImage(buttonImage, for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
//        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with model: ProfileCellSettings) {
        userNameLabel.text = model.title
        iconLabel.text = model.iconText
        userMobileNumberLabel.text = model.subTitle
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

