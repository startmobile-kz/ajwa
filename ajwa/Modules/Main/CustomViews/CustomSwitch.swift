//
//  CustomSwitch.swift
//  ajwa
//
//  Created by Damir Aliyev on 26.08.2023.
//

import SnapKit
import UIKit

final class CustomSwitch: UIView {
    
    // MARK: - State
    
    private var horizontalPositionConstraint: NSLayoutConstraint?
    
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
        setupGestureRecognizers()
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
    
    // MARK: - SetupGestureRecognizers
    
    private func setupGestureRecognizers() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(switchTapped)
        )
        addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Actions
    
    @objc func switchTapped() {
        print("Switched")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 80, height: 40)
    }
    
    private func setupCirularView() {
        let neededSize = frame.height * 0.8
        let cornerRadis = neededSize / 2
        circlularView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(neededSize)
        }
        
        horizontalPositionConstraint = circlularView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2)
        horizontalPositionConstraint?.isActive = true
        
        circlularView.layer.cornerRadius = cornerRadis
    }
    
}
