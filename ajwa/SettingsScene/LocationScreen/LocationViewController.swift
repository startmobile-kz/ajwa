//
//  LocationViewController.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 23.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LocationDisplayLogic: AnyObject
{
  func displayLocation(viewModel: [Location.ModelType.ViewModel])
}

class LocationViewController: UIViewController, LocationDisplayLogic
{
  var interactor: LocationBusinessLogic?
  var router: (NSObjectProtocol & LocationRoutingLogic & LocationDataPassing)?
    var location = [Location.ModelType.ViewModel]()
    
    private lazy var tableView: UITableView = {
            let tableView = UITableView(frame: .zero, style: .insetGrouped)
            tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.identifier)
        tableView.register(CityCell.self, forCellReuseIdentifier: CityCell.identifier)
            tableView.dataSource = self
            tableView.delegate = self
            return tableView
        }()
        
  // MARK: View lifecycle
  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
            super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
            LocationConfigurator.shared.configure(viewController: self)
        }
    
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            LocationConfigurator.shared.configure(viewController: self)
        }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Настройки"

            setupHierarchy()
            setupLayout()
            getLocationData()
        }
    
        private func setupHierarchy() {
            view.addSubview(tableView)
        }
    
        private func setupLayout() {
            tableView.snp.makeConstraints { make in
                make.edges.equalTo(view)
            }
        }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func getLocationData()
  {
      interactor?.getLocation()
  }
  
  func displayLocation(viewModel: [Location.ModelType.ViewModel])
  {
      location.append(contentsOf: viewModel)
      tableView.reloadData()
  }
}
