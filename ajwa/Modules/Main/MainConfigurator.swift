//
//  MainConfigurator.swift
//  ajwa
//
//  Created by Damir Aliyev on 20.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

final class MainConfigurator {
    
    static let shared = MainConfigurator()
    
    func configure(viewController: MainViewController) {
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interactor
    }
}
