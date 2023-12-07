//
//  TrackerCategory.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 07.12.2023.
//

import Foundation
import SwiftData

@Model
final class TrackerCategory {
    var id: UUID
    var name: String
    var trackers: [Tracker]
    
    init(id: UUID = UUID(), name: String, trackers: [Tracker]) {
        self.id = id
        self.name = name
        self.trackers = trackers
    }
}
