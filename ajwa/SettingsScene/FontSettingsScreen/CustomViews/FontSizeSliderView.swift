//
//  FontSliderView.swift
//  ajwa
//
//  Created by Kuanysh al-Khattab Auyelgazy on 07.10.2023.
//

import UIKit
import SnapKit

final class FontSizeSliderView: UIView {

    // MARK: - UI
    private var currentFontSizeLabel: UILabel = {
        let label = UILabel()
        label.text = "12px"
        label.font = AppFont.regular.s20()
        label.textColor = UIColor(red: 0, green: 0.81, blue: 0.57, alpha: 1)
        return label
    }()

    private var slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 8
        slider.maximumValue = 56
        slider.value = 12
        slider.isContinuous = false
        slider.thumbTintColor = AppColor.darkgreen.uiColor
        slider.minimumTrackTintColor = AppColor.darkgreen.uiColor
        slider.addTarget(self, action: #selector(sliderValueDidChange), for: .valueChanged)
        return slider
    }()

    private var minValueLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s14()
        label.textColor = AppColor.gray.uiColor
        label.text = "8px"
        return label
    }()

    private var maxValueLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s14()
        label.textColor = AppColor.gray.uiColor
        label.text = "56px"
        return label
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(currentFontSizeLabel, slider, minValueLabel, maxValueLabel)
        layer.cornerRadius = 12
        backgroundColor = .white
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setupConstraints() {
        currentFontSizeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(20)
        }

        slider.snp.makeConstraints {
            $0.top.equalTo(currentFontSizeLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(272)
        }

        minValueLabel.snp.makeConstraints {
            $0.top.equalTo(slider.snp.bottom).offset(8)
            $0.leading.equalTo(slider.snp.leading)
        }

        maxValueLabel.snp.makeConstraints {
            $0.top.equalTo(slider.snp.bottom).offset(8)
            $0.trailing.equalTo(slider.snp.trailing)
        }
    }

    // MARK: - Private
    @objc
    private func sliderValueDidChange(_ sender: UISlider) {
        let roundedStepValue = round(sender.value / 4) * 4
        sender.value = roundedStepValue
        currentFontSizeLabel.text = String(Int(roundedStepValue)) + "px"
    }
}
