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
        lable.font = AppFont.semibold.s20()
        lable.numberOfLines = 0
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
        contentView.addSubview(textLable)
    }
    
    //    MARK: - SetupLayout
    
    private func setupLayout() {
        textLable.snp.makeConstraints {
            $0.width.equalTo(211)
            $0.height.equalTo(48)
            $0.top.equalTo(contentView).offset(136)
            $0.leading.equalTo(contentView).offset(59.5)
        }
    }
}
