//
//  TrackerListViewModel.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 11.12.2023.
//

import Foundation

final class TrackerListViewModel {
    
    @Published var trackers = [Tracker]()
    @Published var trackerRecords = [TrackerRecord]()
}
