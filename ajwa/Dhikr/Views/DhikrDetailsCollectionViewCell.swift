//
//  DhikrDetailsCollectionViewCell.swift
//  ajwa
//
//  Created by Темирлан Кудайберген on 08.08.2023.
//

import UIKit
import SnapKit

final class DhikrDetailsCollectionViewCell: UICollectionViewCell {
    
    //    MARK: - Propertiees
    
    static let reuseID = String(describing: DhikrDetailsCollectionViewCell.self)
    
    //    MARK: - UI
    
    private lazy var textLable: UILabel = {
        let lable = UILabel()
        lable.font = AppFont.regular.s14()
        lable.textColor = UIColor(red: 0.642, green: 0.642, blue: 0.642, alpha: 1)
        lable.numberOfLines = 2
        return lable
    }()
    
    //    MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - SetupView
    
    private func setupViews() {
        contentView.layer.cornerRadius = 16
        contentView.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)
        addSubview(textLable)
    }
    
    //    MARK: - SetupLayout
    
    private func setupLayout() {
        textLable.snp.makeConstraints {
            $0.centerX.equalTo(contentView.snp.centerX)
            $0.centerY.equalTo(contentView.snp.centerY)
        }
    }
    
    //    MARK: - Public methods
    
    public func setupData(dhikr: String) {
        textLable.text = dhikr
    }
    
}
