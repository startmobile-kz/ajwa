//
//  LanguageCell.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 18.08.2023.
//

import UIKit
import SnapKit

class CheckBox: UIButton {
    var isChecked: Bool = false {
        didSet {
            if isChecked {
                self.setImage(UIImage(named: "img-check"), for: .normal)
            } else {
                self.setImage(UIImage(named: "img-uncheck"), for: .normal)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.isChecked = false
        self.addTarget(self, action:#selector(buttonClicked(sender: )), for: UIControl.Event.touchUpInside)
    }
    
        @objc func buttonClicked(sender: UIButton) {
        if sender == self { isChecked = !isChecked }
    }
}

final class LanguageTypeCell: UITableViewCell {
    
    static let identifier = "LanguageTypeCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s14()
        return label
    }()
    
    private let checkButton: CheckBox = {
        let button = CheckBox()
        button.awakeFromNib()
        return button
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with model: Languages.Something.ViewModel) {
        label.text = model.languageTitle
    }
    
    private func setupHierarchy() {
        contentView.addSubview(label)
        contentView.addSubview(checkButton)
        contentView.clipsToBounds = true
    }
    
    private func setupLayout() {
        
        label.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        checkButton.snp.makeConstraints{make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()

        }
            }
    
    override func prepareForReuse() {
            super.prepareForReuse()
        }
    
    func updateCheckState(_ isSelected: Bool) {
            checkButton.isChecked = isSelected
        }
}
