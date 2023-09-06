//
//  HolidaysViewController.swift
//  ajwa
//
//  Created by Damir Aliyev on 06.09.2023.
//

import UIKit

protocol HolidaysDisplayLogic: AnyObject {
  func displaySomething(viewModel: Holidays.Something.ViewModel)
}

class HolidaysViewController: UIViewController, HolidaysDisplayLogic {
    
  var interactor: HolidaysBusinessLogic?
  var router: (NSObjectProtocol & HolidaysRoutingLogic & HolidaysDataPassing)?
  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething() {
    let request = Holidays.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Holidays.Something.ViewModel) {
    //nameTextField.text = viewModel.name
  }
}
