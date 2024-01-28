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
    @AppStorage("isOnboarding") var isOnboarding = true
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Tracker.self,
            TrackerCategory.self,
            TrackerRecord.self
        ])

        do {
            return try ModelContainer(for: schema, configurations: [])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                TrackersTabView()
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
