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
    
    private lazy var quranImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.solid_book_quran.uiImage
        return imageView
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
        [cityStackView, vectorImageView, quranImageView].forEach {
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
        
        quranImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}
