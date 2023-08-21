//
//  NotificationAndSoundCell.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 15.08.2023.
//

import UIKit
import SnapKit

final class NotificationAndSoundCell: UITableViewCell {
    static let identifier = "NotificationAndSoundCell"

    private let cellContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = AppColor.brightgray.uiColor
        return view
    }()
    
    private let mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.onTintColor = .gray
        mySwitch.transform = CGAffineTransformMakeScale(0.75, 0.75);
        return mySwitch
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s14()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    public func configure(with model: SwitchCellSettings) {
        label.text = model.title
    }

    private func setupHierarchy() {
        
        contentView.addSubview(cellContainer)
        cellContainer.addSubview(label)
        cellContainer.addSubview(mySwitch)
        contentView.clipsToBounds = true
    }

    private func setupLayout() {
        
        cellContainer.snp.makeConstraints {make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.height.equalTo(55)
            make.width.equalTo(324)
            make.centerY.equalToSuperview()
        }
    
        label.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
        }
        
        mySwitch.snp.makeConstraints {make in
            make.trailing.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
        }
    }
}

