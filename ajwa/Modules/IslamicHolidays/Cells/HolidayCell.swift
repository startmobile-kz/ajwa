//
//  HolidayCell.swift
//  ajwa
//
//  Created by Damir Aliyev on 06.09.2023.
//

import UIKit

final class HolidayCell: UICollectionViewCell {
    
    static let reuseID = String(describing: HolidayCell.self)
    
    // MARK: - UI
    
    private lazy var dayButton: UIButton = {
        let button = UIButton()
        button.setTitle("1", for: .normal)
        button.titleLabel?.font = AppFont.semibold.s16()
        button.backgroundColor = AppColor.blue.uiColor
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.text = "Ноября"
        label.textColor = AppColor.gray60.uiColor
        label.font = AppFont.regular.s16()
        return label
    }()
    
    private lazy var backgrounView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.background.uiColor
        return view
    }()
    
    private lazy var nameLabel: UIView = {
        let label = UILabel()
        label.text = "Ид аль-Фитр (Рамадан-байрам)"
        label.font = AppFont.semibold.s14()
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupViews
    
    private func setupViews() {
        contentView.backgroundColor = AppColor.white.uiColor
        
        backgrounView.addSubview(nameLabel)
        [dayButton, monthLabel, backgrounView].forEach {
            contentView.addSubview($0)
        }
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        dayButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(12)
            make.width.equalTo(34)
            make.height.equalTo(36)
        }
        
        monthLabel.snp.makeConstraints { make in
            make.centerY.equalTo(dayButton)
            make.leading.equalTo(dayButton).offset(12)
        }
        
        backgrounView.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(54)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview()
        }
    }
}
