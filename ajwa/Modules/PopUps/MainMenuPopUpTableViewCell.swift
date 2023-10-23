//
//  MainMenuPopUpTableViewCell.swift
//  ajwa
//
//  Created by Темирлан Кудайберген on 22.10.2023.
//

import UIKit
import SnapKit

final class MainMenuPopUpTableViewCell: UITableViewCell {
    
    //    MARK: - Properties
    static let reusID = String(describing: MainMenuPopUpTableViewCell.self)
    
    //    MARK: - UI
    private lazy var leftIcon: UIImageView = {
       let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var nameSectionLable: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 15
        return stackView
    }()
    
    
    //    MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - SetupHierarchy
    private func setupHierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(leftIcon)
        stackView.addArrangedSubview(nameSectionLable)
        
    }
    
    //    MARK: - Setup Constraints
    private func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.leading.equalTo(contentView).offset(16)
            $0.top.equalTo(contentView).offset(18)
        }
    }
    
    func setupData(with data: Items.ModelType.ViewModel) {
        leftIcon.image = UIImage(named: data.leftIcon)
        nameSectionLable.text = data.nameSectionLable
    }
    
}
