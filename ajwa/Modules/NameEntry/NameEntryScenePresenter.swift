//
//  NameEntryScenePresenter.swift
//  ajwa
//
//  Created by ti1ek on 20.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol NameEntryScenePresentationLogic
{
  func presentSomething(response: NameEntryScene.Something.Response)
}

class NameEntryScenePresenter: NameEntryScenePresentationLogic
{
  weak var viewController: NameEntrySceneDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: NameEntryScene.Something.Response)
  {
    let viewModel = NameEntryScene.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
