//
//  PrayerTimeCell.swift
//  ajwa
//
//  Created by Kuanysh al-Khattab Auyelgazy on 02.10.2023.
//

import UIKit
import SnapKit

class PrayerTimeCell: UITableViewCell {

    static let identifier = "PrayerTimeCell"

    // MARK: - UI
    private let prayerNameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s16()
        return label
    }()

    private let customSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.onTintColor = .black
        uiSwitch.transform = CGAffineTransformMakeScale(0.8, 0.8);
        return uiSwitch
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Setup
    private func setupView() {
        backgroundColor = .white

        contentView.addSubview(prayerNameLabel)
        contentView.addSubview(customSwitch)
    }

    private func setupLayout() {
        prayerNameLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }

        customSwitch.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-16)
        }
    }

    // MARK: - Public
    public func configure(with model: PrayerTime.ModelType.ViewModel) {
        prayerNameLabel.text = model.prayerName
        customSwitch.isOn = model.isEnabled
    }
}

