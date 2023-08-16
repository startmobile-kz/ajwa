//
//  SettingsInteractor.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 15.08.2023.
//

import UIKit

protocol SettingsBusinessLogic {
    func fetchSettings()
}

final class SettingsInteractor {
    
    //MARK: - External vars
    var presenter: SettingsPresentationLogic?
}

//MARK: - Business logic

extension SettingsInteractor: SettingsBusinessLogic {
    func fetchSettings() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            var settings = [Settings]()
            
            settings.append(Settings(options: [
                .profileCell(model: ProfileCellSettings(name: "Инсар Е.", phoneNumber: "+7777777777", initials: "И"))
            ]))
            
            settings.append(Settings(options: [
                .headerCell(model: HeaderCellSettings(title: "Местоположение", icon: UIImage(named: "LocationImage"))),
                .locationCell(model: RegularCellSettings(title: "Казахстан, г.Алматы", subTitle: "UTC +6:00")),
                .footerCell(model: SwitchCellSettings(title: "Исламский календарь"))
            ]))
            
            settings.append(Settings(options: [
                .headerCell(model: HeaderCellSettings(title: "Настройки", icon: UIImage(named: "SettingsImage"))),
                .prayTimeCell(model: RegularCellSettings(title: "Время молитв", subTitle: "")),
                .languageCell(model: RegularCellSettings(title: "Язык", subTitle: "Русский")),
                .notificationAndSoundCell(model: SwitchCellSettings(title: "Уведомление и Звук")),
                .fontSizeCell(model: RegularCellSettings(title: "Размер шрифтов", subTitle: "12px"))
            ]))

            settings.append(Settings(options: [
                .shareAndRateCell(model: HeaderCellSettings(title: "Поделиться", icon: UIImage(named: "ShareImage")))
            ]))
            
            settings.append(Settings(options: [
                .shareAndRateCell(model: HeaderCellSettings(title: "Оцените приложение", icon: UIImage(named: "RateImage")))
            ]))
            
            self.presenter?.present(settings)
        }
    }
}
