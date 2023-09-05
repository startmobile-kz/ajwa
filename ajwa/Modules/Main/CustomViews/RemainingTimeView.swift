//
//  RemainingTimeView.swift
//  ajwa
//
//  Created by Damir Aliyev on 20.08.2023.
//

import UIKit
import SnapKit

final class RemainingTimeView: UIView {
    
    // MARK: - UI
    
    private lazy var clockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.clock.uiImage
        return imageView
    }()
    
    private lazy var customSwitch: CustomSwitch = {
        let customSwitch = CustomSwitch()
        return customSwitch
    }()
    
    private lazy var switchView: UISwitch = {
        let view = UISwitch()
        return view
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s32()
        label.textColor = AppColor.black.uiColor
        label.text = "02:34"
        return label
    }()
    
    private lazy var timeBeforePrayerLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s14()
        label.textColor = AppColor.mediumGray.uiColor
        label.text = "Время до намаза"
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 20
    }
    
    // MARK: - SetupViews
    
    private func setupViews() {
        backgroundColor = AppColor.white.uiColor
        
        [clockImageView, customSwitch,timeLabel, timeBeforePrayerLabel].forEach {
            addSubview($0)
        }
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        clockImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(20)
            make.size.equalTo(20)
        }
        
        customSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(clockImageView)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(40)
            make.height.equalTo(20)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(clockImageView.snp.bottom).offset(24)
            make.leading.equalTo(clockImageView)
        }
        
        timeBeforePrayerLabel.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(16)
            make.leading.equalTo(clockImageView)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 170, height: 164)
    }
}
