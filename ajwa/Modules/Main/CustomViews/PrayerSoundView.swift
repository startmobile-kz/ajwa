//
//  PrayerSoundView.swift
//  ajwa
//
//  Created by Damir Aliyev on 26.08.2023.
//

import UIKit
import SnapKit

final class PrayerSoundView: UIView {
    
    // MARK: - State
    
    private let prayerName: PrayerNames
    
    // MARK: - UI
    
    private lazy var prayerNameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.semibold.s16()
        label.textColor = AppColor.blue.uiColor
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var speakerButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.speaker_on.uiImage, for: .normal)
        button.setImage(AppImage.speaker_off.uiImage, for: .selected)
        return button
    }()
    
    // MARK: - Lifecycle
    
    init(prayerName: PrayerNames) {
        self.prayerName = prayerName
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupViews
    
    private func setupViews() {
        [prayerNameLabel, speakerButton].forEach {
            addSubview($0)
        }
        
        setupName()
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        
        speakerButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.size.equalTo(24)
        }
        
        prayerNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.lessThanOrEqualTo(speakerButton.snp.leading).offset(-10)
        }
    }
    
    private func setupName() {
        switch prayerName {
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
        return CGSize(width: 136, height: 24)
    }
}