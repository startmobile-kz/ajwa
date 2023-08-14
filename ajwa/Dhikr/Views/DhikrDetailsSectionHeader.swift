//
//  DhikrDetailsSectionHeader.swift
//  ajwa
//
//  Created by Темирлан Кудайберген on 08.08.2023.
//

import UIKit

final class DhikrDetailsSectionHeader: UICollectionReusableView {
    
    //    MARK: - Propertiees
    
    static let reuseID = String(describing: DhikrDetailsSectionHeader.self)
    
    //    MARK: - UI
    
    private lazy var label: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = UIColor(red: 0.642, green: 0.642, blue: 0.642, alpha: 1)
        label.font = AppFont.regular.s14()
        label.sizeToFit()
        return label
    }()
    
    //    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - SetupViews
    
    private func setupViews() {
        addSubview(label)
    }
    
    //    MARK: - SetupLayout
    
    private func setupLayout() {
        label.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).inset(10)
            $0.leading.equalTo(self.snp.leading).inset(7)
        }
    }
    
    func setHeaderTitle(title: String) {
        label.text = title
    }
    
}
