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

    private let minutesBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1)
        view.layer.cornerRadius = 8
        return view
    }()

    private let minutesLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.semibold.s12()
        return label
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // MARK: - Setup
    private func setupHierarchy() {
        contentView.addSubview(prayerNameLabel)
        minutesBackgroundView.addSubview(minutesLabel)
        contentView.addSubview(minutesBackgroundView)
    }

    private func setupLayout() {
        prayerNameLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }

        minutesBackgroundView.snp.makeConstraints {
            $0.height.equalTo(24)
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
        }

        minutesLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.center.equalToSuperview()
        }
    }

    // MARK: - Public
    public func configure(with model: PrayerTimes.ModelType.ViewModel) {
        prayerNameLabel.text = model.prayerName
        minutesLabel.text = String(model.choosenMinute) + " мин."
    }
}
