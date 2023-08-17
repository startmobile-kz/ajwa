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
        lable.textColor = .black
        lable.numberOfLines = 2
        return lable
    }()
    
    //    MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - SetupView
    
    private func setupViews() {
        contentView.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)
        contentView.layer.cornerRadius = 16
        contentView.addSubview(textLable)
    }
    
    //    MARK: - SetupLayout
    
    private func setupLayout() {
        textLable.snp.makeConstraints {
            $0.top.equalTo(contentView).inset(136)
            $0.leading.equalTo(contentView).inset(59.5)
        }
    }
    
    override func prepareForReuse() {
        self.textLable.text = nil
    }
    
    //    MARK: - Public methods
    
    public func setupData(dhikr: String) {
        return textLable.text = dhikr
    }
}
