//
//  TrackerRecord.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 07.12.2023.
//

import Foundation
import SwiftData

@Model
final class TrackerRecord {
    var id: UUID
    var tracker: Tracker
    var date: Date
    
    init(id: UUID = UUID(), tracker: Tracker, date: Date) {
        self.id = id
        self.tracker = tracker
        self.date = date
    }
}
