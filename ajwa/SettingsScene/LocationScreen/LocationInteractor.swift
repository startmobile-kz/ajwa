//
//  LocationInteractor.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 23.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LocationBusinessLogic
{
  func getLocation()
}

protocol LocationDataStore
{
}

class LocationInteractor: LocationBusinessLogic, LocationDataStore
{
  var presenter: LocationPresentationLogic?
  var worker: LocationWorker?
  var location = [Location.ModelType.ViewModel]()
  
  // MARK: Do something
  
  func getLocation()
  {
    worker = LocationWorker()
    
      self.presenter?.presentLocation(response: worker?.fetchLocation() ?? [])
  }
}