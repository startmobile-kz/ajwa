//
//  AllPrayersView.swift
//  ajwa
//
//  Created by Damir Aliyev on 26.08.2023.
//

import UIKit
import SnapKit

final class AllPrayersView: UIView {
    
    // MARK: - UI
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()

    private lazy var fajrPrayerView = PrayerTimeSoundView(prayer: .fajr)
    private lazy var zuhrPrayerView = PrayerTimeSoundView(prayer: .zuhr)
    private lazy var asrPrayerView = PrayerTimeSoundView(prayer: .asr)
    private lazy var maghribPrayerView = PrayerTimeSoundView(prayer: .maghrib)
    private lazy var ishaPrayerView = PrayerTimeSoundView(prayer: .isha)
//
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
        
        [fajrPrayerView, zuhrPrayerView, asrPrayerView, maghribPrayerView, ishaPrayerView].forEach {
            stackView.addArrangedSubview($0)
        }
        
        addSubview(stackView)
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 350, height: 347)
    }
    
}
