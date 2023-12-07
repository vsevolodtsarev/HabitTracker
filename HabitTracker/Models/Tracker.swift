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
    var isPinned: Bool
    
    init(
        id: UUID = UUID(),
        name: String,
        color: String,
        emoji: String,
        recordCount: Int,
        schedule: [Schedule],
        isPinned: Bool = false
    ) {
        self.id = id
        self.name = name
        self.color = color
        self.emoji = emoji
        self.recordCount = recordCount
        self.schedule = schedule
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
}
