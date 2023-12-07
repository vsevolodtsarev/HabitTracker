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
    var trackerId: UUID
    var date: Date
    
    init(id: UUID = UUID(), trackerId: UUID, date: Date) {
        self.id = id
        self.trackerId = trackerId
        self.date = date
    }
}
