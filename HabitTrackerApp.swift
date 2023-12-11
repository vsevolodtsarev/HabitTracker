//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 06.12.2023.
//

import SwiftUI
import SwiftData

@main
struct HabitTrackerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Tracker.self,
            TrackerCategory.self,
            TrackerRecord.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            TrackersTabView()
        }
        .modelContainer(sharedModelContainer)
    }
}
