//
//  Date + Extension.swift
//  ajwa
//
//  Created by Adlet Zhantassov on 29.08.2023.
//

import Foundation

extension Date {

 static func getCurrentDate() -> String {

        let dateFormatter = DateFormatter()
     
        dateFormatter.dateFormat = "dd"

        return dateFormatter.string(from: Date())

    }
}
