//
//  SettingsPresenter.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 13.08.2023.
//

import Foundation

protocol SettingsPresentationLogic {
    func presentData(data: [Settings])
}


class SettingsPresenter{
    
    
    // MARK: - External vars
    weak var viewController: SettingsDisplayLogic?
}


// MARK: Presentation Logic
extension SettingsPresenter: SettingsPresentationLogic {
    
  
    func presentData(data: [Settings]) {
        let viewModel = data
                
        viewController?.displayData(data: viewModel)
    }
    
    
    
    
}
