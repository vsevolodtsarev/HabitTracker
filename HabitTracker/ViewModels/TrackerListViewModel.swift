//
//  TrackerListViewModel.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 11.12.2023.
//

import Foundation
import SwiftData
import SwiftUI

final class TrackerListViewModel {
    @Environment(\.modelContext) private var modelContext
    @Published var trackers = [Tracker]()
    @Published var trackerRecords = [TrackerRecord]()
    
    let testCategory = TrackerCategory(name: "test Category")
    var testTracker: Tracker {
        Tracker(name: "Test Tracker", color: "🤡", emoji: "🤡", schedule: [Schedule.friday], trackerCategory: testCategory)
    }
}
