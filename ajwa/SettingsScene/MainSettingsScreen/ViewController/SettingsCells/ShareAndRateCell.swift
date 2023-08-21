//
//  ShareAndRateCell.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 15.08.2023.
//

import UIKit
import SnapKit

final class ShareAndRateCell: UITableViewCell {
    
    static let identifier = "ShareAndRateCell"
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = AppColor.blue.uiColor
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        return imageView
    }()
   
    private let label: UILabel = {
        let label = UILabel()
        label.font = AppFont.medium.s14()
        return label
    }()
    
    private let disclosureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with model: HeaderCellSettings) {
        label.text = model.title
        iconImageView.image = model.icon
        disclosureImageView.image = model.disclosureImage
    }
    
    private func setupHierarchy() {
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(label)
        contentView.addSubview(disclosureImageView)
        contentView.clipsToBounds = true
    }
    
    private func setupLayout() {
        iconContainer.snp.makeConstraints {make in
            make.leading.equalToSuperview().offset(12)
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.centerY.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints {make in
            make.center.equalToSuperview()
        }
        
        label.snp.makeConstraints{ make in
            make.leading.equalTo(iconContainer.snp.trailing).offset(12)
            make.centerY.equalToSuperview()
        }
        
        disclosureImageView.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
        }
    }
}
