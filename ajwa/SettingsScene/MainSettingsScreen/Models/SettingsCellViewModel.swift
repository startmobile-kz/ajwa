//
//  SettingsCellViewModel.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 15.08.2023.
//

import UIKit

struct Settings {
    let options : [SettingsCellType]
}

enum SettingsCellType {
    case headerCell(model: HeaderCellSettings)
    case footerCell(model: SwitchCellSettings)
    case profileCell(model: ProfileCellSettings)
    case shareAndRateCell(model: HeaderCellSettings)
    case locationCell(model: RegularCellSettings)
    case prayTimeCell(model: RegularCellSettings)
    case languageCell(model: RegularCellSettings)
    case notificationAndSoundCell(model: SwitchCellSettings)
    case fontSizeCell(model: RegularCellSettings)
    
    var height: CGFloat {
        switch self {
        case .headerCell:
            return 50
        case .footerCell:
            return 48
        case .profileCell:
            return 76
        case .locationCell:
            return 60
        case .shareAndRateCell:
            return 54
        case .prayTimeCell:
            return 60
        case .languageCell:
            return 60
        case .fontSizeCell:
            return 60
        case .notificationAndSoundCell:
            return 60
        }
    }
}

struct ProfileCellSettings {
    let name: String
    let phoneNumber: String
    let initials: String
}

struct RegularCellSettings {
    let title : String
    let subTitle: String
    let disclosureImage = AppImage.Disclosure.uiImage
}

struct HeaderCellSettings {
    let title: String
    let icon: UIImage?
    let disclosureImage = AppImage.Disclosure.uiImage
}

struct SwitchCellSettings {
    let title : String
}
