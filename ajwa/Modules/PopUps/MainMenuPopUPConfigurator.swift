//
//  MainMenuPopUPConfigurator.swift
//  ajwa
//
//  Created by Темирлан Кудайберген on 22.10.2023.
//

import UIKit

final class MainMenuPopUPConfigurator {
    
    static let shared = MainMenuPopUPConfigurator()
    
    func configure(viewController: MainMenuPopUPViewController) {
        let interactor = MainMenuPopUPInteractor()
        let presenter = MainMenuPopUpPresenter()
        
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}
