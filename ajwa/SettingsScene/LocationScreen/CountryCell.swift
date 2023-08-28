//
//  LocationDetailsCell.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 23.08.2023.
//

import UIKit
import SnapKit

class CountryCell: UITableViewCell {
    static let identifier = String.init(describing: CountryCell.self)
    
    
    var locationLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s14()
        return label
    }()
        
    public var disclosureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
//        imageView.image = isExpanded ? UIImage(named: "") : AppImage.expand.uiImage?.withRenderingMode(.alwaysTemplate)
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
//            locationLabel.text = model.countries.last
//            disclosureImageView.image = (model.isExpanded ? UIImage(named: "") : AppImage.expand.uiImage)?.withRenderingMode(.alwaysTemplate) }
//    }
//    
//    
    private func setupHierarchy() {
        contentView.addSubview(locationLabel)
        contentView.addSubview(disclosureImageView)
        contentView.clipsToBounds = true
    }
    
    private func setupLayout() {
        locationLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        
        disclosureImageView.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
        }
    }
}
