//
//  AllPrayersView.swift
//  ajwa
//
//  Created by Damir Aliyev on 26.08.2023.
//

import UIKit
import SnapKit

final class AllPrayersView: UIView {

    // MARK: - UI

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private lazy var namazTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Время намазов"
        label.font = AppFont.semibold.s20()
        label.textColor = AppColor.black.uiColor
        label.textAlignment = .center
        return label
    }()

    private lazy var fajrPrayerView = FajrView()
    private lazy var zuhrPrayerView = DhuhrView()
    private lazy var asrPrayerView = AsrView()
    private lazy var maghribPrayerView = MaghribView()
    private lazy var ishaPrayerView = IshaView()

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

        [namazTimeLabel,
         fajrPrayerView,
         zuhrPrayerView,
         asrPrayerView,
         maghribPrayerView,
         ishaPrayerView].forEach {
            stackView.addArrangedSubview($0)
        }

        addSubview(stackView)
    }

    func update(with viewModel: NamazDetailResult) {
        fajrPrayerView.set(with: viewModel)
        zuhrPrayerView.set(with: viewModel)
        asrPrayerView.set(with: viewModel)
        maghribPrayerView.set(with: viewModel)
        ishaPrayerView.set(with: viewModel)
    }

    // MARK: - SetupConstraints

    private func setupConstraints() {
        namazTimeLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
        }

        [fajrPrayerView,
         zuhrPrayerView,
         asrPrayerView,
         maghribPrayerView,
         ishaPrayerView].forEach {
            $0.snp.makeConstraints { make in
                make.height.equalTo(24)
            }
        }

        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-24)
        }
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 168, height: 340)
    }

}
