//
//  PrayerTimeViewController.swift
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

protocol PrayerTimeDisplayLogic: AnyObject{
    func displayPrayers(viewModel: [PrayerTimes.ModelType.ViewModel])
}

class PrayerTimeViewController: UIViewController, PrayerTimeDisplayLogic{
    var interactor: PrayerTimeBusinessLogic?
    var router: (NSObjectProtocol & PrayerTimeRoutingLogic & PrayerTimeDataPassing)?
    var prayers = [PrayerTimes.ModelType.ViewModel]()

    // MARK: UI
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите молитву, чтобы вручную отрегулировать ее время начало"
        label.font = AppFont.regular.s12()
        label.textColor = AppColor.darkGray.uiColor
        label.numberOfLines = 2
        return label
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(PrayerTimeCell.self, forCellReuseIdentifier: PrayerTimeCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.alwaysBounceVertical = false
        tableView.backgroundColor = .secondarySystemBackground
        return tableView
    }()

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
        PrayerTimeConfigurator.shared.configure(viewController: self)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        PrayerTimeConfigurator.shared.configure(viewController: self)
    }

    // MARK: - Lifecycle
    override func viewDidLoad(){
        super.viewDidLoad()
        setupView()
        setupConstraints()
        getPrayersData()
    }

    // MARK: - Setup
    private func setupView() {
        title = "Время молитв"
        view.backgroundColor = .secondarySystemBackground

        view.addSubview(detailLabel)
        view.addSubview(tableView)
        view.addSubview(saveButton)
    }

    private func setupConstraints() {
        detailLabel.snp.makeConstraints {
            $0.width.equalTo(278)
            $0.top.equalToSuperview().offset(120)
            $0.leading.equalTo(20)
        }

        tableView.snp.makeConstraints {
            $0.height.equalToSuperview()
            $0.top.equalTo(detailLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }

        saveButton.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    // MARK: Actions
    func getPrayersData() {
        interactor?.getPrayers()
    }

    func displayPrayers(viewModel: [PrayerTimes.ModelType.ViewModel]){
        prayers.append(contentsOf: viewModel)
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension PrayerTimeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        prayers.count
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        8
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = prayers[indexPath.section]
        let cell: PrayerTimeCell = tableView.dequeueReusableCell()
        cell.configure(with: model)
        cell.selectionStyle = .none
        cell.layer.cornerRadius = 16
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PrayerTimeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let minutesSliderVC = MinutesSliderViewController()
        minutesSliderVC.modalPresentationStyle = .formSheet
        let sheet = minutesSliderVC.sheetPresentationController
        let fraction = UISheetPresentationController.Detent.custom { context in
            140
        }
        sheet?.detents = [fraction]
        navigationController?.present(minutesSliderVC, animated: true)
    }
}
