//
//  IshaView.swift
//  ajwa
//
//  Created by Kuanysh al-Khattab Auyelgazy on 07.11.2023.
//

import UIKit
import SnapKit

final class IshaView: UIView {

    func set(with viewModel: NamazDetailResult) {
        prayerTimeLabel.text = viewModel.isha
        let currentNamaz = viewModel.getCurrentNamaz()
        if currentNamaz == .isha {
            prayerNameLabel.textColor = AppColor.blue.uiColor
            prayerTimeLabel.textColor = AppColor.blue.uiColor
        } else {
            prayerNameLabel.textColor = AppColor.black.uiColor
            prayerTimeLabel.textColor = AppColor.black.uiColor
        }
    }

    // MARK: - UI

    private lazy var prayerNameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.semibold.s16()
        label.text = "Құптан"
        label.numberOfLines = 0
        return label
    }()

    private lazy var prayerTimeLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.semibold.s16()
        label.numberOfLines = 0
        return label
    }()

    private lazy var speakerButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.speaker_on.uiImage, for: .normal)
        button.setImage(AppImage.speaker_off.uiImage, for: .selected)
        return button
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - SetupViews

    private func setupViews() {
        [prayerNameLabel, prayerTimeLabel, speakerButton].forEach {
            addSubview($0)
        }
    }

    // MARK: - SetupConstraints

    private func setupConstraints() {

        speakerButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.size.equalTo(24)
        }

        prayerNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.lessThanOrEqualTo(speakerButton.snp.leading).offset(-10)
        }

        prayerTimeLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()        }
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 136, height: 24)
    }
}

