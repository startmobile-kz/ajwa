//
//  MainHeaderView.swift
//  ajwa
//
//  Created by Damir Aliyev on 20.08.2023.
//

import UIKit
import SnapKit

final class MainHeaderView: UIView {
    
    // MARK: - UI
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s12()
        label.textColor = AppColor.gray60.uiColor
        label.text = "Город"
        return label
    }()
    
    private lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s15()
        label.textColor = AppColor.gray20.uiColor
        label.text = "Алматы"
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
        
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        
    }
}
