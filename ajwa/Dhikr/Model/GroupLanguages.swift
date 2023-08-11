//
//  SectionLanguages.swift
//  ajwa
//
//  Created by Темирлан Кудайберген on 10.08.2023.
//

import Foundation

enum GroupLanguages {
    
    case arabic([ListItem])
    case transcription([ListItem])
    case russian([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .arabic(let items),
                .transcription(let items),
                .russian(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
        case .arabic(_):
            return "На арабском"
        case .transcription(_):
            return "Транскрипция"
        case .russian(_):
            return "Перевод"
        }
    }
}
