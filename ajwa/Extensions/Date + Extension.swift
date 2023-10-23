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
    
    static func getCurrentMonth() -> Int {
        return Calendar.current.dateComponents([.month], from: Date()).month ?? 0
    }
    
    static func getCurrentMonthTitle() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "RU")
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: Date())
    }
    
//    func getDaysInMonth() -> Int {
//        let calendar = Calendar.current
//        let dateComponents = DateComponents(year: calendar.component(.year, from: self), month: calendar.component(.month, from: self))
//        let date = calendar.date(from: dateComponents)!
//        let range = calendar.range(of: .day, in: .month, for: date)!
//        let numDays = range.count
//        return numDays
//    }
    static func getDaysInMonth() -> Int {
        let calendar = Calendar.current
        let date = Date()
        let interval = calendar.dateInterval(of: .month, for: date)!
        let days = calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
        return days
    }
}
