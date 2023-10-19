//
//  PrayerTimeSoundView.swift
//  ajwa
//
//  Created by Damir Aliyev on 19.10.2023.
//

import UIKit

final class PrayerTimeSoundView: UIView {
    
    private let prayer: PrayerTime
    
    // MARK: - UI
    
    // MARK: - Lifecycle
    
    init(prayer: PrayerTime) {
        self.prayer = prayer
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupViews
    
    private func setupViews() {
        
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        
    }
}
