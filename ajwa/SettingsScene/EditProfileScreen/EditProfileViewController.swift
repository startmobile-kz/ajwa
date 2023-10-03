//
//  EditProfileViewController.swift
//  ajwa
//
//  Created by Kuanysh al-Khattab Auyelgazy on 10.09.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import SnapKit

protocol EditProfileDisplayLogic: AnyObject{
    func displayScreen(viewModel: Profile.ModelType.ViewModel)
}

final class EditProfileViewController: UIViewController, EditProfileDisplayLogic{
    var interactor: EditProfileBusinessLogic?
    var router: (NSObjectProtocol & EditProfileRoutingLogic & EditProfileDataPassing)?

    // MARK: - Outlets

    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var avatarView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.lightgreen.uiColor
        view.layer.cornerRadius = 18
        return view
    }()

    private lazy var nameInitialLabel: UILabel = {
        let label = UILabel()
        label.text = "И"
        label.textColor = AppColor.darkgreen.uiColor
        label.font = AppFont.semibold.s36()
        return label
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.font = AppFont.regular.s14()
        label.textColor = AppColor.gray.uiColor
        return label
    }()

    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.text = "Инсар"
        textField.layer.cornerRadius = 16
        return textField
    }()

    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Номер телефона"
        label.font = AppFont.regular.s14()
        label.textColor = AppColor.gray.uiColor
        return label
    }()

    private lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.text = "+ 7 707 188 1834"
        textField.layer.cornerRadius = 16
        return textField
    }()

    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.titleLabel?.font = AppFont.semibold.s16()
        button.backgroundColor = AppColor.blue.uiColor
        button.setTitle("Сохранить", for: .normal)
        return button
    }()
    
    // MARK: View lifecycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupView()
        setupViews()
        setupNavBar()
        setupConstraints()
    }

    // MARK: - Setup

    private func setupView() {
        title = "Редактировать"
        nameTextField.addPaddingToTextField()
        phoneTextField.addPaddingToTextField()
        view.backgroundColor = AppColor.background.uiColor
    }

    private func setupViews() {
        view.addSubview(containerView)
        containerView.addSubview(avatarView)
        avatarView.addSubview(nameInitialLabel)
        containerView.addSubview(nameLabel)
        containerView.addSubview(nameTextField)
        containerView.addSubview(phoneLabel)
        containerView.addSubview(phoneTextField)
        view.addSubview(saveButton)
    }

    private func setupNavBar() {
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: AppFont.semibold.s16()
        ]
    }

    private func setupConstraints() {
        containerView.snp.makeConstraints {
            $0.top.equalTo(220)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }

        avatarView.snp.makeConstraints {
            $0.width.height.equalTo(80)
        }

        nameInitialLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

        nameLabel.snp.makeConstraints {
            $0.top.equalTo(avatarView.snp_bottomMargin).offset(32)
        }

        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp_bottomMargin).offset(12)
            $0.width.equalToSuperview()
            $0.height.equalTo(48)
        }

        phoneLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp_bottomMargin).offset(16)
        }

        phoneTextField.snp.makeConstraints {
            $0.top.equalTo(phoneLabel.snp_bottomMargin).offset(12)
            $0.width.equalToSuperview()
            $0.height.equalTo(48)
        }

        saveButton.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    // MARK: Actions

    public func configure(with model: Profile.ModelType.ViewModel) {
        nameTextField.text = model.name
        phoneTextField.text = model.phoneNumber
    }
    
    func displayScreen(viewModel: Profile.ModelType.ViewModel){
    }
}