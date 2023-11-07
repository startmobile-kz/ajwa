//
//  ParticularNamazView.swift
//  ajwa
//
//  Created by Damir Aliyev on 20.08.2023.
//

import UIKit
import SnapKit

final class ParticularNamazView: UIView {

    func update(viewModel: NamazDetailResult) {
        let currentNamaz = viewModel.getCurrentNamaz()
        switch currentNamaz {
        case .fajr:
            namazNameLabel.text = "Бесін"
            timeLabel.text = viewModel.dhuhr
        case .dhuhr:
            namazNameLabel.text = "Екінті"
            timeLabel.text = viewModel.asr
        case .asr:
            namazNameLabel.text = "Ақшам"
            timeLabel.text = viewModel.maghrib
        case .maghrib:
            namazNameLabel.text = "Құптан"
            timeLabel.text = viewModel.isha
        case .isha:
            namazNameLabel.text = "Таң"
            timeLabel.text = viewModel.fajr
        }
    }

    // MARK: - UI

    private lazy var mosqueIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.mosque_icon.uiImage
        return imageView
    }()

    private lazy var namazNameLabel: UILabel = {
        let label = UILabel()
        //        label.font = AppFont.semibold.s32()
        label.textColor = AppColor.black.uiColor
        return label
    }()

    private lazy var timeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()

    private lazy var beginningLabel: UILabel = {
        let label = UILabel()
        //        label.font = AppFont.regular.s14()
        label.textColor = AppColor.mediumGray.uiColor
        label.text = "Начало"
        return label
    }()

    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        //        label.font = AppFont.semibold.s14()
        label.textColor = AppColor.blue.uiColor
        return label
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

    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = 20
    }

    // MARK: - SetupViews

    private func setupViews() {
        backgroundColor = AppColor.white.uiColor

        [mosqueIconImageView, namazNameLabel, timeStackView].forEach {
            addSubview($0)
        }

        [beginningLabel, timeLabel].forEach {
            timeStackView.addArrangedSubview($0)
        }
    }

    // MARK: - SetupConstraints

    private func setupConstraints() {
        mosqueIconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(20)
            make.size.equalTo(20)
        }

        namazNameLabel.snp.makeConstraints { make in
            make.top.equalTo(mosqueIconImageView.snp.bottom).offset(24)
            make.leading.equalTo(mosqueIconImageView)
        }

        timeStackView.snp.makeConstraints { make in
            make.top.equalTo(namazNameLabel.snp.bottom).offset(16)
            make.leading.equalTo(mosqueIconImageView)
        }
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 170, height: 164)
    }
}
