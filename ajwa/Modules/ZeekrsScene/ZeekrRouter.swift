//
//  ZeekrRouter.swift
//  ajwa
//
//  Created by Adlet Zhantassov on 22.10.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol ZeekrRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ZeekrDataPassing
{
  var dataStore: ZeekrDataStore? { get }
}

class ZeekrRouter: NSObject, ZeekrRoutingLogic, ZeekrDataPassing
{
  weak var viewController: ZeekrViewController?
  var dataStore: ZeekrDataStore?
  
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
  
  //func navigateToSomewhere(source: ZeekrViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: ZeekrDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
