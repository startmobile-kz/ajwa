//
//  MainMenuPopUpWorker.swift
//  ajwa
//
//  Created by Темирлан Кудайберген on 22.10.2023.
//

import Foundation

final class MainMenuPopUpWorker {
    
    func fetchMockData()-> [Items.ModelType.ViewModel] {
        
        let data = [
            Items.ModelType.ViewModel(leftIcon: "calendar", nameSectionLable: "Таблица на месяц"),
            Items.ModelType.ViewModel(leftIcon: "star", nameSectionLable: "Исламские праздники"),
            Items.ModelType.ViewModel(leftIcon: "paintedOverSettings", nameSectionLable: "Настройки")]
        
        return data
    }
}
