//
//  LanguagesInteractor.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 16.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol LanguagesBusinessLogic {
    func doSomething()
}

protocol LanguagesDataStore {}

final class LanguagesInteractor: LanguagesBusinessLogic, LanguagesDataStore {
    var presenter: LanguagesPresentationLogic?
    var worker: LanguagesWorker?
    var languages = [Languages.Something.ViewModel]()
    
    // MARK: Do something
    
    func doSomething() {
        worker = LanguagesWorker()
        self.presenter?.presentSomething(response: worker?.fetchLanguages() ?? [])
    }
}
