//
//  MainBottomView.swift
//  ajwa
//
//  Created by Damir Aliyev on 28.08.2023.
//

import UIKit
import SnapKit

final class MainBottomView: UIView {
    
    // MARK: - UI
    
    private lazy var compassImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.compass.uiImage
        return imageView
    }()
    
    private lazy var ellipsisImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.ellipsis.uiImage
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 25
    }
    
    // MARK: - SetupViews
    
    private func setupViews() {
        backgroundColor = AppColor.white.uiColor
        
        [compassImageView, ellipsisImageView].forEach {
            addSubview($0)
        }
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        compassImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(12)
            make.size.equalTo(30)
        }
        
        ellipsisImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-12)
            make.size.equalTo(30)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 350, height: 54)
    }
}
