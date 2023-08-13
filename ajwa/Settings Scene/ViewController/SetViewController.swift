//
//  SetViewController.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 13.08.2023.
//

import UIKit

protocol SettingsDisplayLogic: class {
    
    func displayData()
}

class SetViewController: UIViewController {
    
    
    
    
    // MARK: - External vars
    
    // MARK: - Internal vars
    
    private var interactor: SettingsBusinessLogic?
    
    
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
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
    }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            interactor?.fetchSettings()
            
            // Do any additional setup after loading the view.
        }
        
        
    
}


extension SetViewController: SettingsDisplayLogic{
    func displayData() {
        
    }
    
    
}
