//
//  MonthSectionHeader.swift
//  ajwa
//
//  Created by Damir Aliyev on 06.09.2023.
//

import UIKit

final class MonthSectionHeader: UICollectionReusableView {
    
    // MARK: - State
    
    static let reuseID = String(describing: MonthSectionHeader.self)
    
    // MARK: - UI
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.semibold.s16()
        label.sizeToFit()
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSectionHeaderTitle(title: String) {
        titleLabel.text = title
    }
    
    // MARK: - SetupViews
    
    private func setupViews() {
        addSubview(titleLabel)
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }
}

