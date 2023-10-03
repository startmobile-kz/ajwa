//
//  HolidaysRouter.swift
//  ajwa
//
//  Created by Damir Aliyev on 06.09.2023.
//

import UIKit

@objc protocol HolidaysRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol HolidaysDataPassing {
    var dataStore: HolidaysDataStore? { get }
}

final class HolidaysRouter: NSObject, HolidaysRoutingLogic, HolidaysDataPassing {
    
    weak var viewController: HolidaysViewController?
    var dataStore: HolidaysDataStore?
    
}
