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
    private var currentPage = 1
    
    // MARK: - UI
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
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
        
        setupControls()
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        setupControlsConstraints()
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func changeCurrentPage(to page: Int) {
        if currentPage == page || page > stackView.arrangedSubviews.count {
            return
        }
        
        stackView.arrangedSubviews[currentPage - 1].backgroundColor = AppColor.controlsGray.uiColor
        resizeControls(prevIndex: currentPage - 1, newIndex: page - 1)
        stackView.arrangedSubviews[page - 1].backgroundColor = AppColor.blue.uiColor
        currentPage = page
    }
    
    private func setupControls() {
        stackView.arrangedSubviews[currentPage - 1].backgroundColor = AppColor.blue.uiColor
    }
    
    private func setupControlsConstraints() {
        for i in 0..<stackView.arrangedSubviews.count {
            let subview = stackView.arrangedSubviews[i]
            if i == currentPage - 1 {
                subview.snp.makeConstraints { make in
                    make.width.equalTo(48)
                    make.height.equalTo(4)
                }
            } else {
                subview.snp.makeConstraints { make in
                    make.width.equalTo(12)
                    make.height.equalTo(4)
                }
            }
        }
    }
    
    private func resizeControls(prevIndex: Int, newIndex: Int) {
        let prevControl = stackView.arrangedSubviews[prevIndex]
        let currControl = stackView.arrangedSubviews[newIndex]
        
        prevControl.snp.remakeConstraints { make in
            make.width.equalTo(12)
            make.height.equalTo(4)
        }
        
        currControl.snp.remakeConstraints { make in
            make.width.equalTo(48)
            make.height.equalTo(4)
        }
    }
    
    private func createControl() -> UIView {
        let view = UIView()
        view.backgroundColor = AppColor.controlsGray.uiColor
        return view
    }
}
