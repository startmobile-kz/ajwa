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

    // MARK: - Outlets

    private let prayerNameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s16()
        return label
    }()

    private let minutesLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.semibold.s12()
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

    public func configure(with model: PrayerTimes.ModelType.ViewModel) {
        prayerNameLabel.text = model.prayerName
        minutesLabel.text = String(model.choosenMinute)
    }

    private func setupHierarchy() {
        contentView.addSubview(prayerNameLabel)
        contentView.addSubview(minutesLabel)
    }

    private func setupLayout() {
        prayerNameLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }

        minutesLabel.snp.makeConstraints{make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
    }
}
