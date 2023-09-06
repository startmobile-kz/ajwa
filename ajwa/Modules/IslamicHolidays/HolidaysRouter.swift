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
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: HolidaysViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: HolidaysDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
