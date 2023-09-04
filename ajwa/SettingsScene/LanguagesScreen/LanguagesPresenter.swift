//
//  LanguagesPresenter.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 16.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LanguagesPresentationLogic {
    func presentLanguages(response: [Languages.ModelType.ViewModel])
}

class LanguagesPresenter: LanguagesPresentationLogic {
    weak var viewController: LanguagesDisplayLogic?
    
    // MARK: Do something
    
    func presentLanguages(response: [Languages.ModelType.ViewModel]) {
        viewController?.displayLanguages(viewModel: response)
    }
}