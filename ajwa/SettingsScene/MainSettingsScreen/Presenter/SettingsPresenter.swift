//
//  SettingsPresenter.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 15.08.2023.
//

import UIKit

protocol SettingsPresentationLogic {
    func present(_ data: [Settings])
}

class SettingsPresenter {
    // MARK: - External vars
    weak var viewController: SettingsDisplayLogic?
}

// MARK: Presentation Logic
extension SettingsPresenter: SettingsPresentationLogic {
    func present(_ data: [Settings]) {
        viewController?.display(data)
    }
}
