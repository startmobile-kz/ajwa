//
//  HolidaysConfigurator.swift
//  ajwa
//
//  Created by Damir Aliyev on 06.09.2023.
//

import UIKit

final class HolidaysConfigurator {
    
    static let shared = HolidaysConfigurator()
    
    func configure(viewController: HolidaysViewController) {
        let interactor = HolidaysInteractor()
        let presenter = HolidaysPresenter()
        let router = HolidaysRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interactor
    }
}
