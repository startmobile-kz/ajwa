//
//  DhikrModel.swift
//  ajwa
//
//  Created by Темирлан Кудайберген on 09.08.2023.
//

import Foundation

struct DhikrModel {
    
    static let shared = DhikrModel()
    
    private let arabic: GroupLanguages = {
        .arabic([.init(text: "На арабском")])
    }()
    
    private let transcription: GroupLanguages = {
        .transcription([.init(text: "Транскрипция")])
    }()
    
    private let russian: GroupLanguages = {
        .russian([.init(text: "На русском")])
    }()
    
    var pageData: [GroupLanguages] {
        [arabic, transcription, russian]
    }
    
}
