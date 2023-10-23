//
//  MainMenuPopUPInteractor.swift
//  ajwa
//
//  Created by Темирлан Кудайберген on 22.10.2023.
//

import UIKit

protocol MainMenuPopUPBusinessLogic {
    func getMockData()
}

final class MainMenuPopUPInteractor: MainMenuPopUPBusinessLogic {
    
    var presenter: MainMenuPopUpPresentationLogic?
    var worker: MainMenuPopUpWorker?
    var rowList = [Items.ModelType.ViewModel]()
    
    // MARK: Do something
    
    func getMockData() {
        worker = MainMenuPopUpWorker()
        self.presenter?.presentSomething(response: worker?.fetchMockData() ?? [Items.ModelType.ViewModel(leftIcon: "calendar", nameSectionLable: "Таблица на месяц"),
                                                                               Items.ModelType.ViewModel(leftIcon: "star", nameSectionLable: "Исламские праздники"),
                                                                               Items.ModelType.ViewModel(leftIcon: "paintedOverSettings", nameSectionLable: "Настройки")])
    }
}
