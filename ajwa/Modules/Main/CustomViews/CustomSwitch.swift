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
    
    private var isOn = false
    private var horizontalPositionConstraint: NSLayoutConstraint?
    
    // MARK: - UI
    
    private lazy var circlularView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColor.black.uiColor
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
        backgroundColor = AppColor.white.uiColor
        layer.borderWidth = 1
        layer.borderColor = AppColor.black.cgColor
        [circlularView].forEach {
            addSubview($0)
        }
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        horizontalPositionConstraint = circlularView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2)
        horizontalPositionConstraint?.isActive = true
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
        if isOn {
            self.horizontalPositionConstraint?.constant = 2
            isOn = false
        } else {
            self.horizontalPositionConstraint?.constant =
            frame.width - circlularView.frame.width - 2
            isOn = true
        }
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        } completion: { _ in
            self.setupColor()
        }
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
        
        circlularView.layer.cornerRadius = cornerRadis
    }
    
    private func setupColor() {
        if !self.isOn {
            self.backgroundColor = AppColor.white.uiColor
            self.circlularView.backgroundColor = AppColor.black.uiColor
        } else {
            self.backgroundColor = AppColor.black.uiColor
            self.circlularView.backgroundColor = AppColor.white.uiColor
        }
    }
    
}
