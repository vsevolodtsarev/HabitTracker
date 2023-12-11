//
//  Date + Extension.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 08.12.2023.
//

import Foundation

extension Date {
    static func getDateWithoutTime() -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: Date())
        let dateWithoutTime = calendar.date(from: components) ?? Date()
        return dateWithoutTime
    }
}
