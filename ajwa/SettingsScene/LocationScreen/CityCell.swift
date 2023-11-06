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
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s14()
        return label
    }()
    
    var utcTimeLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s12()
        label.textColor = .gray
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
    
    public func configure(with model: Location.ModelType.ViewModel) {
        label.text = model.cityTitle
        utcTimeLabel.text = model.utcTimezone
        isChecked = model.isSelected
    }
    
    private func setupHierarchy() {
        contentView.addSubview(label)
        contentView.addSubview(utcTimeLabel)
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
        
        utcTimeLabel.snp.makeConstraints { make in
            make.trailing.equalTo(checkImageView.snp.leading).offset(-8)
            make.centerY.equalToSuperview()
        }
    }
}
