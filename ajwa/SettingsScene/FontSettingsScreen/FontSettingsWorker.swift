//
//  FontSettingsWorker.swift
//  ajwa
//
//  Created by Kuanysh al-Khattab Auyelgazy on 09.09.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

final class FontSettingsWorker {
    
    func fetchFonts() -> [FontSettings.ModelType.ViewModel] {
        let fonts = [
            FontSettings.ModelType.ViewModel(languageTitle: "На русском", fontTranscription: "А а"),
            FontSettings.ModelType.ViewModel(languageTitle: "На казахском", fontTranscription: "Ә ә"),
            FontSettings.ModelType.ViewModel(languageTitle: "На арабском", fontTranscription: "ب ا ")
        ]
        return fonts
    }
}
