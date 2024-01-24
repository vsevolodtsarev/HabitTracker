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
    var schedule: [Schedule]
    var trackerCategory: TrackerCategory
    var isPinned: Bool
    @Relationship var records: [TrackerRecord]?
    
    
    init(
        id: UUID = UUID(),
        name: String,
        color: String,
        emoji: String,
        recordCount: Int = 0,
        schedule: [Schedule],
        trackerCategory: TrackerCategory,
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
}

enum TypeOfTracker {
    case habit
    case nonRegularEvent
}
