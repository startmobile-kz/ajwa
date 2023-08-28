//
//  SacredEventCell.swift
//  ajwa
//
//  Created by Damir Aliyev on 28.08.2023.
//

import UIKit
import SnapKit

final class SacredEventCell: UICollectionViewCell {
    
    static let reuseID = String(describing: SacredEventCell.self)
    
    // MARK: - UI
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var eventNameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s12()
        label.text = "Рамаданға"
        return label
    }()
    
    private lazy var remainingDaysLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.bold.s20()
        label.textColor = AppColor.blue.uiColor
        label.text = "92 күн қалды"
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
    
    private func setupViews() {
        
    }
    
    private func setupConstraints() {
        
    }
}
