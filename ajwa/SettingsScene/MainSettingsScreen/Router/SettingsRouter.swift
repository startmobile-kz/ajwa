//
//  SettingsRouter.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 15.08.2023.
//

import UIKit

protocol SettingsRoutingLogic: AnyObject {
    func navigateToDetails(settingsId: Int)
}

class SettingsRouter {
    weak var viewController: UIViewController?
}

extension SettingsRouter: SettingsRoutingLogic {
    func navigateToDetails(settingsId: Int) {
//        Navigation to other screens
    }
}
