//
//  MainMenuPopUPViewController.swift
//  ajwa
//
//  Created by Темирлан Кудайберген on 22.10.2023.
//

import UIKit
import SnapKit
import PanModal

protocol MainMenuPopUPDisplayLogic: AnyObject {
    func displayPrayer(viewModel: [Items.ModelType.ViewModel])
}

final class MainMenuPopUPViewController: UIViewController, MainMenuPopUPDisplayLogic {
    
    //    MARK: - Properties
    var interactor: MainMenuPopUPBusinessLogic?
    var filteredPrayers = [Items.ModelType.ViewModel]()
    
    
    //    MARK: - UI
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(MainMenuPopUpTableViewCell.self,
                           forCellReuseIdentifier: MainMenuPopUpTableViewCell.reusID)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    //    MARK: - Lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        MainMenuPopUPConfigurator.shared.configure(viewController: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        MainMenuPopUPConfigurator.shared.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getPrayerData()
        setupHiearchy()
        setupConstraints()
    }
    
    //    MARK: - SetupHiearchy
    private func setupHiearchy() {
        view.addSubview(tableView)
    }
    
    //    MARK: - SetupConstraints
    private func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    //    MARK: - Protocol and communication methods
    func displayPrayer(viewModel: [Items.ModelType.ViewModel]) {
        filteredPrayers = viewModel
        tableView.reloadData()
    }
    
    func getPrayerData() {
        interactor?.getMockData()
    }
    
}

extension MainMenuPopUPViewController: UITableViewDelegate, UITableViewDataSource, PanModalPresentable {
    //    MARK: - DataSource metodhs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPrayers.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainMenuPopUpTableViewCell.reusID,
                                                       for: indexPath) as? MainMenuPopUpTableViewCell
        else {
            fatalError("Could not cast to SacredEventCell")
        }
        cell.setupData(with: filteredPrayers[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    //    MARK: - PanModal Presentable
    var panScrollable: UIScrollView? {
        return tableView
    }
}

