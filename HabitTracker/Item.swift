//
//  Item.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 06.12.2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
