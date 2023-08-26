//
//  CustomSwitch.swift
//  ajwa
//
//  Created by Damir Aliyev on 26.08.2023.
//

import SnapKit
import UIKit

final class CustomSwitch: UIView {
    
    // MARK: - UI
    
    private lazy var circlularView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        return view
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
        layer.cornerRadius = frame.height / 2
        
        setupCirularView()
    }
    
    // MARK: - SetupViews
    
    private func setupViews() {
        backgroundColor = .black
        
        [circlularView].forEach {
            addSubview($0)
        }
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {

    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 80, height: 40)
    }
    
    private func setupCirularView() {
        let neededSize = frame.height * 0.9
        let cornerRadis = neededSize / 2
        circlularView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(2)
            make.size.equalTo(neededSize)
        }
        circlularView.layer.cornerRadius = cornerRadis
    }
    
}
