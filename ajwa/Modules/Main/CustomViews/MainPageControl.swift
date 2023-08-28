//
//  MainPageControl.swift
//  ajwa
//
//  Created by Damir Aliyev on 28.08.2023.
//

import UIKit
import SnapKit

final class MainPageControl: UIView {
    
    // MARK: - State
    
    private let amountOfPages: Int
    
    // MARK: - UI
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var v1: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    // MARK: - Lifecycle
    
    init(amountOfPages: Int) {
        self.amountOfPages = amountOfPages
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.arrangedSubviews.forEach {
            $0.layer.cornerRadius = 2
        }
    }
    
    // MARK: - SetupViews
    
    private func setupViews() {
        for _ in 1...amountOfPages {
            stackView.addArrangedSubview(createControl())
        }

        addSubview(stackView)
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        stackView.arrangedSubviews.forEach {
            $0.snp.makeConstraints { make in
                make.width.equalTo(12)
                make.height.equalTo(4)
            }
        }
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func createControl() -> UIView {
        let view = UIView()
        view.backgroundColor = AppColor.controlsGray.uiColor
        return view
    }
}
