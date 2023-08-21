//
//  LanguageCell.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 18.08.2023.
//

import UIKit
import SnapKit

class CheckBox: UIButton {
    
}

final class LanguageTypeCell: UITableViewCell {
    static let identifier = "LanguageTypeCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s14()
        return label
    }()
    
    private let checkImageView = UIImageView()

    private var isChecked: Bool = false {
        didSet {
            let checkImage = UIImage(named: "img-check")
            let uncheckImage = UIImage(named: "img-uncheck")
            self.checkImageView.image = isChecked ? checkImage : uncheckImage
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with model: Languages.Something.ViewModel) {
        label.text = model.languageTitle
        isChecked = model.isSelected
    }
    
    private func setupHierarchy() {
        contentView.addSubview(label)
        contentView.addSubview(checkImageView)
        contentView.clipsToBounds = true
    }

    private func setupLayout() {
        label.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        checkImageView.snp.makeConstraints{make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()

        }
    }
}
