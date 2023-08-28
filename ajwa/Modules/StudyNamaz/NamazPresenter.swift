//
//  NamazPresenter.swift
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

protocol NamazPresentationLogic
{
  func presentSomething(response: Namaz.Something.Response)
}

class NamazPresenter: NamazPresentationLogic
{
  weak var viewController: NamazDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Namaz.Something.Response)
  {
    let viewModel = Namaz.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
