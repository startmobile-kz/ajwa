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
        stackView.spacing = 43
        return stackView
    }()
    
    private lazy var fajrPrayerView = PrayerSoundView(prayerName: .fajr)
    private lazy var zuhrPrayerView = PrayerSoundView(prayerName: .zuhr)
    private lazy var asrPrayerView = PrayerSoundView(prayerName: .asr)
    private lazy var maghribPrayerView = PrayerSoundView(prayerName: .maghrib)
    private lazy var ishaPrayerView = PrayerSoundView(prayerName: .isha)
    
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
        
        [fajrPrayerView,
         zuhrPrayerView,
         asrPrayerView,
         maghribPrayerView,
         ishaPrayerView].forEach {
            stackView.addArrangedSubview($0)
        }
        
        addSubview(stackView)
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        [fajrPrayerView,
         zuhrPrayerView,
         asrPrayerView,
         maghribPrayerView,
         ishaPrayerView].forEach {
            $0.snp.makeConstraints { make in
                make.height.equalTo(24)
            }
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-24)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 168, height: 340)
    }
    
}
