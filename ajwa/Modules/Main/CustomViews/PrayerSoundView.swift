//
//  PrayerSoundView.swift
//  ajwa
//
//  Created by Damir Aliyev on 26.08.2023.
//

import UIKit
import SnapKit

final class PrayerSoundView: UIView {
    
    // MARK: - UI
    
    private lazy var prayerNameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.semibold.s16()
        label.textColor = .blue
        return label
    }()
    
    private lazy var speakerButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.speaker_on.uiImage, for: .normal)
        button.setImage(AppImage.speaker_off.uiImage, for: .selected)
        return button
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
        [prayerNameLabel, speakerButton].forEach {
            addSubview($0)
        }
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        prayerNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        speakerButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}
