//
//  PrayerTimePresenter.swift
//  ajwa
//
//  Created by Kuanysh al-Khattab Auyelgazy on 10.09.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol PrayerTimePresentationLogic{
    func presentPrayers(response: [PrayerTimes.ModelType.ViewModel])
}

class PrayerTimePresenter: PrayerTimePresentationLogic{
    weak var viewController: PrayerTimeDisplayLogic?
    
    // MARK: Do something

    func presentPrayers(response: [PrayerTimes.ModelType.ViewModel]){
        viewController?.displayPrayers(viewModel: response)
    }
}
