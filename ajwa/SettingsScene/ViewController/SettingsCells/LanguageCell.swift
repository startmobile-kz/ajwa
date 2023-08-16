//
//  LanguageCell.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 15.08.2023.
//

import UIKit
import SnapKit

final class LanguageCell: UITableViewCell {
    
    static let identifier = "LanguageCell"
    
    private let cellContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = AppColor.lightgray.uiColor
        return view
    }()

    
    private let languageTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s14()
        return label
    }()
    
    private let languageSubtitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s12()
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
        languageTitleLabel.text = model.title
        languageSubtitleLabel.text = model.subTitle
        disclosureImageView.image = model.disclosureImage
    }
    
    private func setupHierarchy() {
     
        contentView.addSubview(cellContainer)
        cellContainer.addSubview(languageTitleLabel)
        cellContainer.addSubview(languageSubtitleLabel)
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
        
        languageTitleLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
        }
        
        disclosureImageView.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
        languageSubtitleLabel.snp.makeConstraints{ make in
            make.trailing.equalTo(disclosureImageView.snp.leading).offset(-12)
            make.centerY.equalToSuperview()
        }
    }
}
