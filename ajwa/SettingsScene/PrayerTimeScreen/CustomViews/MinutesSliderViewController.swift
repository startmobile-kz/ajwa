//
//  MinutesSliderView.swift
//  ajwa
//
//  Created by Kuanysh al-Khattab Auyelgazy on 09.10.2023.
//

import UIKit
import SnapKit

final class MinutesSliderViewController: UIViewController {

    // MARK: - UI
    private var currentValue: UILabel = {
        let label = UILabel()
        label.text = "+60 мин"
        label.font = AppFont.regular.s24()
        label.textColor = AppColor.darkgreen.uiColor
        return label
    }()

    private var slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = -60
        slider.maximumValue = 60
        slider.value = 0
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
        label.text = "-60"
        return label
    }()

    private var maxValueLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.regular.s14()
        label.textColor = AppColor.gray.uiColor
        label.text = "60"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(currentValue)
        view.addSubview(slider)
        view.addSubview(minValueLabel)
        view.addSubview(maxValueLabel)
        view.backgroundColor = .white
        setupConstraints()
    }


    // MARK: - Setup
    private func setupConstraints() {
        currentValue.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(20)
        }

        slider.snp.makeConstraints {
            $0.top.equalTo(currentValue.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
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
        let roundedStepValue = round(sender.value / 10) * 10
        sender.value = roundedStepValue
        currentValue.text = roundedStepValue > 0 ?  "+\(String(Int(roundedStepValue))) мин" :  "\(String(Int(roundedStepValue))) мин"
    }
}
