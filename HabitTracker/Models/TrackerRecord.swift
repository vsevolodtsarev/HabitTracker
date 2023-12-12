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
    let id: UUID
    var date: Date
    
    init(id: UUID = UUID(), date: Date) {
        self.id = id
        self.date = date
    }
}
