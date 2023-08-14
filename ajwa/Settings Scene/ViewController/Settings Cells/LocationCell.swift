//
//  LocationCell.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 10.08.2023.
//

import UIKit
import SnapKit

let cellContainerColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)

final class LocationCell: UITableViewCell {
    static let identifier = "LocationCell"
    
    private let cellContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = cellContainerColor
        return view
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        return label
    }()
    
    private let utcTimeLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.textColor = .gray
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
    
    public func configure(with model: RegularCellSettings) {
        locationLabel.text = model.title
        utcTimeLabel.text = model.subTitle
        disclosureImageView.image = model.disclosureImage
    }
    
    private func setupHierarchy() {
        contentView.addSubview(cellContainer)
        cellContainer.addSubview(locationLabel)
        cellContainer.addSubview(utcTimeLabel)
        cellContainer.addSubview(disclosureImageView)

        contentView.clipsToBounds = true
    }
    
    private func setupLayout() {
        cellContainer.snp.makeConstraints {make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.height.equalTo(55)
            make.width.equalTo(324)
            make.centerY.equalToSuperview()
        }
        
        locationLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
        }
        
        disclosureImageView.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
        utcTimeLabel.snp.makeConstraints{ make in
            make.trailing.equalTo(disclosureImageView.snp.leading).offset(-12)
            make.centerY.equalToSuperview()
        }
    }
}
