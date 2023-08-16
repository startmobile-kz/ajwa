//
//  FontSizeCell.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 15.08.2023.
//

import UIKit
import SnapKit

final class FontSizeCell: UITableViewCell {
    
    static let identifier = "FontSizeCell"
    
    private let cellContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = cellContainerColor
        return view
    }()
    
    private let fontSizeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        return label
    }()
    
    private let fontSizeSubtitleLabel: UILabel = {
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
        fontSizeTitleLabel.text = model.title
        fontSizeSubtitleLabel.text = model.subTitle
        disclosureImageView.image = model.disclosureImage
    }
    
    private func setupHierarchy() {
        contentView.addSubview(cellContainer)
        cellContainer.addSubview(fontSizeTitleLabel)
        cellContainer.addSubview(fontSizeSubtitleLabel)
        cellContainer.addSubview(disclosureImageView)
        contentView.clipsToBounds = true
    }
    
    private func setupLayout() {
    
        cellContainer.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.height.equalTo(55)
            make.width.equalTo(324)
            make.centerY.equalToSuperview()
        }
        
        fontSizeTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
        }
        
        disclosureImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
        fontSizeSubtitleLabel.snp.makeConstraints { make in
            make.trailing.equalTo(disclosureImageView.snp.leading).offset(-12)
            make.centerY.equalToSuperview()
        }
    }
}
