//
//  SettingsCell.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 11.08.2023.
//

import UIKit
import SnapKit



class PrayTimeCell: UITableViewCell {
    
    static let identifier = "PrayTimeCell"
    
    private let cellContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = cellContainerColor
        return view
    }()

       
    private let prayTimeLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
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
        prayTimeLabel.text = model.title
        disclosureImageView.image = model.disclosureImage
        
    }
    
    private func setupHierarchy() {
     
        contentView.addSubview(cellContainer)
        cellContainer.addSubview(prayTimeLabel)
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
        
        prayTimeLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
        }
        
        disclosureImageView.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
        
    }
}

