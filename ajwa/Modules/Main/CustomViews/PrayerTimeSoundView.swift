//
//  PrayerTimeSoundView.swift
//  ajwa
//
//  Created by Damir Aliyev on 19.10.2023.
//

import UIKit

final class PrayerTimeSoundView: UIView {
    
    private let prayer: PrayerNames
    
    // MARK: - UI
    
    private lazy var prayerNameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.semibold.s16()
        label.textColor = AppColor.black.uiColor
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.semibold.s18()
        label.textColor = AppColor.black.uiColor
        label.text = "06:08"
        return label
    }()
    
    private lazy var speakerButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.speaker_on.uiImage, for: .normal)
        button.setImage(AppImage.speaker_off.uiImage, for: .selected)
        return button
    }()
    
    // MARK: - Lifecycle
    
    init(prayer: PrayerNames) {
        self.prayer = prayer
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
        setupPrayerName()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupViews
    
    private func setupViews() {
        [prayerNameLabel, timeLabel, speakerButton].forEach({
            addSubview($0)
        })
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        prayerNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.leading.equalTo(prayerNameLabel.snp.trailing).offset(77.5)
        }
        
        speakerButton.snp.makeConstraints { make in
            make.centerY.equalTo(prayerNameLabel)
            make.trailing.equalToSuperview()
            make.size.equalTo(24)
        }
    }
    
    private func setupPrayerName() {
        let zeroWidthSpace: Character = "\u{200B}"
        let spacingForWordWrapping = String(repeating: zeroWidthSpace, count: 6)
        
        switch prayer {
        case .fajr:
            prayerNameLabel.text = "Таң"
        case .zuhr:
            prayerNameLabel.text = "Бесін"
        case .asr:
            prayerNameLabel.text = "Екінті"
        case .maghrib:
            prayerNameLabel.text = "Ақшам"
        case .isha:
            prayerNameLabel.text = "Құптан"
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 350, height: 24)
    }
}
