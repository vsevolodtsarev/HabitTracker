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
    let id: UUID
    var name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}
