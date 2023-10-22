//
//  MainMenuPopUpPresenter.swift
//  ajwa
//
//  Created by Темирлан Кудайберген on 22.10.2023.
//

import UIKit

protocol MainMenuPopUpPresentationLogic {
    func presentSomething(response: [Items.ModelType.ViewModel])
}

final class MainMenuPopUpPresenter: MainMenuPopUpPresentationLogic {
    weak var viewController: MainMenuPopUPDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: [Items.ModelType.ViewModel]) {
        viewController?.displayPrayer(viewModel: response)
    }
}
