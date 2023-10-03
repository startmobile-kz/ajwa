//
//  EditProfilePresenter.swift
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

protocol EditProfilePresentationLogic{
    func present(response: Profile.ModelType.ViewModel)
}

final class EditProfilePresenter: EditProfilePresentationLogic{
    weak var viewController: EditProfileDisplayLogic?

    // MARK: Do something

    func present(response: Profile.ModelType.ViewModel){
        viewController?.displayScreen(viewModel: response)
    }
}