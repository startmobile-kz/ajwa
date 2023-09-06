//
//  HolidaysViewController.swift
//  ajwa
//
//  Created by Damir Aliyev on 06.09.2023.
//

import UIKit

protocol HolidaysDisplayLogic: AnyObject {
    func displaySomething(viewModel: Holidays.Something.ViewModel)
}

class HolidaysViewController: UIViewController, HolidaysDisplayLogic {
    
    var interactor: HolidaysBusinessLogic?
    var router: (NSObjectProtocol & HolidaysRoutingLogic & HolidaysDataPassing)?
    
    // MARK: - UI
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    // MARK: - SetupViews
    
    private func setupViews() {
        view.backgroundColor = AppColor.background.uiColor
    }
    
    private func setupConstraints() {
        
    }
    
    // MARK: - SetupConstraints
    
    // MARK: Do something
    
    func doSomething() {
        let request = Holidays.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Holidays.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}
