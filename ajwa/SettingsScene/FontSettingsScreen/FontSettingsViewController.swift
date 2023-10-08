//
//  FontSettingsViewController.swift
//  ajwa
//
//  Created by Kuanysh al-Khattab Auyelgazy on 09.09.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import SnapKit

protocol FontSettingsDisplayLogic: AnyObject {
    func displayFonts(viewModel: [FontSettings.ModelType.ViewModel])
}

final class FontSettingsViewController: UIViewController, FontSettingsDisplayLogic {

    var interactor: FontSettingsBusinessLogic?
    var router: (NSObjectProtocol & FontSettingsRoutingLogic & FontSettingsDataPassing)?
    var fonts = [FontSettings.ModelType.ViewModel]()

    // MARK: - UI
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Размер шрифта"
        label.font = AppFont.medium.s20()
        return label
    }()

    private let inRussianButton = InRussianButton()
    private let inKazakhButton = InKazakhButton()
    private let inArabicButton = InArabicButton()

    private var fontSizeSliderView = FontSizeSliderView()

    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.titleLabel?.font = AppFont.semibold.s16()
        button.backgroundColor = AppColor.blue.uiColor
        button.setTitle("Сохранить", for: .normal)
        return button
    }()

    // MARK: Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        FontSettingsConfigurator.shared.configure(viewController: self)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        FontSettingsConfigurator.shared.configure(viewController: self)
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        getFontsData()
    }

    // MARK: - Setup
    private func setupView() {
        view.backgroundColor = AppColor.background.uiColor
        view.addSubviews(titleLabel)
        view.addSubviews(inRussianButton, inKazakhButton, inArabicButton, saveButton)
        view.addSubview(fontSizeSliderView)
    }

    private func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(24)
        }

        inRussianButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(50)
        }

        inKazakhButton.snp.makeConstraints {
            $0.top.equalTo(inRussianButton.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(50)
        }

        inArabicButton.snp.makeConstraints {
            $0.top.equalTo(inKazakhButton.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(50)
        }

        fontSizeSliderView.snp.makeConstraints {
            $0.top.equalTo(inArabicButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(120)
        }

        saveButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(fontSizeSliderView.snp.bottom).offset(20)
            $0.leading.equalTo(24)
            $0.trailing.equalTo(-24)
        }
    }
    
    // MARK: Actions
    public func getFontsData() {
        interactor?.getFonts()
    }

    public func displayFonts(viewModel: [FontSettings.ModelType.ViewModel]) {
        fonts.append(contentsOf: viewModel)
    }
}
