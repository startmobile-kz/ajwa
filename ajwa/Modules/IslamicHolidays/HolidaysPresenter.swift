//
//  HolidaysPresenter.swift
//  ajwa
//
//  Created by Damir Aliyev on 06.09.2023.
//

import UIKit

protocol HolidaysPresentationLogic
{
  func presentSomething(response: Holidays.Something.Response)
}

class HolidaysPresenter: HolidaysPresentationLogic
{
  weak var viewController: HolidaysDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Holidays.Something.Response)
  {
    let viewModel = Holidays.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
