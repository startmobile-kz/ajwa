//
//  Model.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 10.08.2023.
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

}

struct ProfileCellSettings {
    let title: String
    let subTitle: String
    let iconText: String
}

struct RegularCellSettings {
    let title : String
    let subTitle: String
    let disclosureImage = UIImage(named: "DisclosureImage")
}

struct HeaderCellSettings {
    let title: String
    let icon: UIImage?
    let disclosureImage = UIImage(named: "DisclosureImage")
}

struct SwitchCellSettings {
    let title : String
}

