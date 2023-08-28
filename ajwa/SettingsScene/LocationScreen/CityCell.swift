//
//  CityCell.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 27.08.2023.
//

import UIKit
import SnapKit

class CityCell: UITableViewCell {
    static let identifier = String.init(describing: CityCell.self)
    
    
    var locationLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s14()
        return label
    }()
    
    
    var utcTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "UTC +6:00"
        label.font = AppFont.regular.s12()
        label.textColor = .gray
        return label
    }()
    
    var disclosureImageView: UIImageView = {
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
    
//    public func configureHeader(with model: Location.ModelType.ViewModel) {
//                if model.isExpanded {
//            countryLabel.text = model.countryName
//            disclosureImageView.image = (model.isExpanded ? UIImage(named: "") : AppImage.expand.uiImage)?.withRenderingMode(.alwaysTemplate) }
//
//        else {
//
//            countryLabel.text = model.citiesName.first
//        }
//    }
//
    
    private func setupHierarchy() {
        contentView.addSubview(locationLabel)
        contentView.addSubview(utcTimeLabel)
        contentView.addSubview(disclosureImageView)
        contentView.clipsToBounds = true
    }
    
    private func setupLayout() {
        locationLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        utcTimeLabel.snp.makeConstraints{ make in
            make.trailing.equalTo(disclosureImageView.snp.leading).offset(-12)
            make.centerY.equalToSuperview()
        }
        
        disclosureImageView.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
        }
    }
}

