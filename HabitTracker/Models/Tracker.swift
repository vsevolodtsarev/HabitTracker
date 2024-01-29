//
//  Tracker.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 06.12.2023.
//

import Foundation
import SwiftData

@Model
final class Tracker {
    let id: UUID
    var name: String
    var color: String
    var emoji: String
    var recordCount: Int
    var schedule: String
    var trackerCategory: String
    var isPinned: Bool
    
    
    init(
        id: UUID = UUID(),
        name: String,
        color: String,
        emoji: String,
        recordCount: Int = 0,
        schedule: String,
        trackerCategory: String,
        isPinned: Bool = false
    ) {
        self.id = id
        self.name = name
        self.color = color
        self.emoji = emoji
        self.recordCount = recordCount
        self.schedule = schedule
        self.trackerCategory = trackerCategory
        self.isPinned = isPinned
    }
}

enum Schedule: String, CaseIterable, Codable {
    case monday = "Понедельник"
    case tuesday = "Вторник"
    case wednesday = "Среда"
    case thursday = "Четверг"
    case friday = "Пятница"
    case saturday = "Суббота"
    case sunday = "Воскресенье"
    
    var shortName: String {
        switch self {
        case .monday: return "Пн"
        case .tuesday: return "Вт"
        case .wednesday: return "Ср"
        case .thursday: return "Чт"
        case .friday: return "Пт"
        case .saturday: return "Сб"
        case .sunday: return "Вс"
        }
    }
    
    var orderDay: Int {
        switch self {
        case .monday: return 1
        case .tuesday: return 2
        case .wednesday: return 3
        case .thursday: return 4
        case .friday: return 5
        case .saturday: return 6
        case .sunday: return 7
        }
    }
    
    static func scheduleToString(_ weekdays: Set<Schedule>?) -> String? {
        guard let weekdays else { return nil }
        let indexes = weekdays.map { Self.allCases.firstIndex(of: $0) }
        var result = ""
        for i in 0..<7 {
            if indexes.contains(i) {
                result += "1"
            } else {
                result += "0"
            }
        }
        return result
    }
    
    static func stringToSchedule(from string: String?) -> Set<Schedule>? {
        guard let string else { return nil }
        var weekdays = Set<Schedule>()
        for (index, value) in string.enumerated() {
            guard value == "1" else { continue }
            let weekday = Self.allCases[index]
            weekdays.insert(weekday)
        }
        return weekdays
    }
}

enum TypeOfTracker {
    case habit
    case nonRegularEvent
}
