//
//  SectionHeaderView.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 10.08.2023.
//

import UIKit
import SnapKit

final class HeaderCell: UITableViewCell {
    static let identifier = "HeaderCell"

    private let iconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = buttonColor
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        return imageView
    }()
   
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(16)
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
    
    public func configure(with model: HeaderCellSettings) {
        label.text = model.title
        iconImageView.image = model.icon
    }
    
    private func setupHierarchy() {
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(label)

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
    }
}

