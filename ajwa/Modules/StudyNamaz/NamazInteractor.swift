//
//  NamazInteractor.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 28.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol NamazBusinessLogic
{
  func getNamazList()
}

protocol NamazDataStore
{
}

class NamazInteractor: NamazBusinessLogic, NamazDataStore
{
    
    
  var presenter: NamazPresentationLogic?
  var worker: NamazWorker?
  var namaz = [Namaz.ModelType.ViewModel]()

  // MARK: Do something
  
  func getNamazList()
  {
    worker = NamazWorker()
    
      self.presenter?.presentSomething(response: worker?.fetchNamaz() ?? [])
  }
}


  
 