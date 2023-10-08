//
//  FontSettingsTypeCell.swift
//  ajwa
//
//  Created by Kuanysh al-Khattab Auyelgazy on 09.09.2023.
//

import Foundation

import UIKit
import SnapKit

final class FontSettingsTypeCell: UITableViewCell {
    static let identifier = "FontSettingsTypeCell"

    // MARK: - UI

    private lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s14()
        label.textColor = AppColor.darkGray.uiColor
        return label
    }()

    private lazy var scriptLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.semibold.s20()
        return label
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        contentView.addSubview(languageLabel)
        contentView.addSubview(scriptLabel)
    }

    private func setupLayout() {
        languageLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }

        scriptLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
        }
    }

    public func configure(with model: FontSettings.ModelType.ViewModel) {
        languageLabel.text = model.languageTitle
        scriptLabel.text = model.fontTranscription
    }
}
