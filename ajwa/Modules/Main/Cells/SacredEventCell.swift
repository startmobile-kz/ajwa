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
        imageView.image = AppImage.sacred_event.uiImage
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
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
        contentView.layer.cornerRadius = 20
    }
    
    private func setupViews() {
        contentView.backgroundColor = AppColor.white.uiColor
        [imageView, stackView].forEach {
            contentView.addSubview($0)
        }
        
        [eventNameLabel, remainingDaysLabel].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-6)
            make.width.equalTo(138)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalTo(imageView)
            make.trailing.equalToSuperview().offset(-35)
        }
    }
}
