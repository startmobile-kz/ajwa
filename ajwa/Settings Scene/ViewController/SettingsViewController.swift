//
//  SettingsViewController.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 10.08.2023.
//

import UIKit
import SnapKit

protocol SettingsDisplayLogic: AnyObject {

    func displayData(data: [Settings])
}

class SettingsViewController: UIViewController {
 
    // MARK: - Outlets
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.identifier)
        tableView.register(ShareAndRateCell.self, forCellReuseIdentifier: ShareAndRateCell.identifier)
        tableView.register(LocationCell.self, forCellReuseIdentifier: LocationCell.identifier)
        tableView.register(HeaderCell.self, forCellReuseIdentifier: HeaderCell.identifier)
        tableView.register(FooterCell.self, forCellReuseIdentifier: FooterCell.identifier)
        tableView.register(PrayTimeCell.self, forCellReuseIdentifier: PrayTimeCell.identifier)
        tableView.register(LanguageCell.self, forCellReuseIdentifier: LanguageCell.identifier)
        tableView.register(FontSizeCell.self, forCellReuseIdentifier: FontSizeCell.identifier)
        tableView.register(NotificationAndSoundCell.self, forCellReuseIdentifier: NotificationAndSoundCell.identifier)
        tableView.separatorStyle = .none
        tableView.sectionFooterHeight = 0
        tableView.sectionHeaderHeight = 10

        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    
    // MARK: - External vars
    
    private(set) weak var router: SettingsRoutingLogic?
    
    // MARK: - Internal vars
    
    private var interactor: SettingsBusinessLogic?
    var settings = [Settings]()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        let viewController = self
        let presenter = SettingsPresenter()
        let interactor = SettingsInteractor()
        let router = SettingsRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        router.viewController = viewController
        viewController.router = router
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchSettings()
        title = "Настройки"
        setupHierarchy()
        setupHLayout()
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupHLayout() {
        tableView.snp.makeConstraints {make in
            make.edges.equalTo(view)
        }
    }
    
}

//MARK: - Display logic implementation
extension SettingsViewController: SettingsDisplayLogic{
    func displayData(data: [Settings]) {
        settings.append(contentsOf: data)
        tableView.reloadData()
    }
}
