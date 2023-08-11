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
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 14)
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
            $0.top.equalTo(self.snp.top)
            $0.leading.equalTo(self.snp.leading)
        }
    }
    
    func setHeaderTitle(title: String) {
        label.text = title
    }
    
}
