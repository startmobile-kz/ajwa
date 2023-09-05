//
//  ParticularNamazView.swift
//  ajwa
//
//  Created by Damir Aliyev on 20.08.2023.
//

import UIKit
import SnapKit

final class ParticularNamazView: UIView {
    
    // MARK: - UI
    
    private lazy var mosqueIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.mosque_icon.uiImage
        return imageView
    }()
    
    private lazy var namazNameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.semibold.s32()
        label.textColor = AppColor.black.uiColor
        label.text = "Екинти"
        return label
    }()
    
    private lazy var timeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var beginningLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s14()
        label.textColor = AppColor.mediumGray.uiColor
        label.text = "Начало"
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.semibold.s14()
        label.textColor = AppColor.blue.uiColor
        label.text = "06:08"
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
    
    // MARK: - SetupViews
    
    private func setupViews() {
        backgroundColor = AppColor.white.uiColor
        
        [mosqueIconImageView, namazNameLabel, timeStackView].forEach {
            addSubview($0)
        }
        
        [beginningLabel, timeLabel].forEach {
            timeStackView.addArrangedSubview($0)
        }
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        mosqueIconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(20)
            make.size.equalTo(20)
        }
        
        namazNameLabel.snp.makeConstraints { make in
            make.top.equalTo(mosqueIconImageView.snp.bottom).offset(24)
            make.leading.equalTo(mosqueIconImageView)
        }
        
        timeStackView.snp.makeConstraints { make in
            make.top.equalTo(namazNameLabel.snp.bottom).offset(16)
            make.leading.equalTo(mosqueIconImageView)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 170, height: 164)
    }
}
