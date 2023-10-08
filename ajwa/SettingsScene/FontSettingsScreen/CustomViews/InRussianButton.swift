//
//  InRussianButton.swift
//  ajwa
//
//  Created by Kuanysh al-Khattab Auyelgazy on 08.10.2023.
//

import UIKit
import SnapKit

final class InRussianButton: UIButton {

    // MARK: - UI
    private let languageLabel: UILabel = {
        let label = UILabel()
        label.text = "На русском"
        label.font = AppFont.regular.s14()
        label.textColor = AppColor.darkGray.uiColor
        return label
    }()

    private let fontTranscriptLabel: UILabel = {
        let label = UILabel()
        label.text = "А а"
        label.font = AppFont.semibold.s20()
        label.textColor = AppColor.black.uiColor
        return label
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(languageLabel, fontTranscriptLabel)
        layer.cornerRadius = 12
        backgroundColor = .white
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setupConstraints() {
        languageLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }

        fontTranscriptLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
}
