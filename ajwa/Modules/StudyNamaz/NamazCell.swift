//
//  NamazCell.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 28.08.2023.
//

import UIKit
import SnapKit

class NamazCell: UITableViewCell {
    
    static let identifier = String.init(describing: NamazCell.self)
    
    lazy var namazIdLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.clipsToBounds = true
        label.textAlignment = .center
        label.backgroundColor = AppColor.blue.uiColor
        label.layer.cornerRadius = 12
        label.font = AppFont.medium.s14()
        return label
    }()
    
    lazy var namazTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.black.uiColor
        label.numberOfLines = 1
        label.font = AppFont.medium.s14()
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.gray.uiColor
        label.numberOfLines = 0
        label.font = AppFont.regular.s12()
        return label
    }()
  
    private lazy var checkmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "checkmark"), for: .normal)
        return button
    }()
    
    public func configure(with model: Namaz.ModelType.ViewModel) {
        namazIdLabel.text = model.id
        namazTitleLabel.text = model.title
        descriptionLabel.text = model.description
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(namazIdLabel)
        contentView.addSubview(namazTitleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(checkmarkButton)
        
        
        namazIdLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(12)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
                
        namazTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(namazIdLabel.snp.centerY)
            make.leading.equalTo(namazIdLabel.snp.trailing).offset(16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(namazIdLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-12)
        }
        
        checkmarkButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

