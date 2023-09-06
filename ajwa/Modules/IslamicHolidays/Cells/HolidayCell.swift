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
        
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        
    }
}
