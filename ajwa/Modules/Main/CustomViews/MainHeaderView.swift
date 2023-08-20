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
    
    private lazy var cityStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
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
    
    private lazy var vectorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.vector_right.uiImage
        return imageView
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = AppColor.blue.uiColor
        button.setImage(AppImage.solid_book_quran.uiImage, for: .normal)
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
        [cityStackView, vectorImageView, rightButton].forEach {
            addSubview($0)
        }
        
        [cityLabel, cityNameLabel].forEach {
            cityStackView.addArrangedSubview($0)
        }
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        cityStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        vectorImageView.snp.makeConstraints { make in
            make.centerY.equalTo(cityNameLabel)
            make.leading.equalTo(cityNameLabel.snp.trailing).offset(12)
        }
        
        rightButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.size.equalTo(44)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 350, height: 44)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rightButton.layer.cornerRadius = rightButton.frame.height / 2
    }
}
