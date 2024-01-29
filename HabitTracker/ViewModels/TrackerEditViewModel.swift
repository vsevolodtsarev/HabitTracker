//
//  TrackerEditViewModel.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 18.01.2024.
//

import Foundation
import SwiftUI

@Observable
final class TrackerEditViewModel {
    var typeOfTracker: TypeOfTracker
    var viewName: String
    var trackerName: String = ""
    var selectedEmoji: String?
    var selectedColor: Color?
    var schedule: Set<Schedule> = []
    var selectedCategory: TrackerCategory?
    
    init(typeOfTracker: TypeOfTracker, viewName: String) {
        self.typeOfTracker = typeOfTracker
        self.viewName = viewName
    }
    
    var isEnableCreateButton: Bool {
        if !trackerName.isEmpty &&
            selectedEmoji != nil &&
            selectedColor != nil &&
            !schedule.isEmpty &&
            selectedCategory != nil
        { return true } else
        { return false }
    }
    
    func addNewTracker() -> Tracker? {
        guard let selectedColor else { return nil }
        guard let selectedEmoji else { return nil }
        guard let selectedCategory else { return nil }
        guard let stringSchedule = Schedule.scheduleToString(schedule) else { return nil }
        let color = Color.colorToString(UIColor(selectedColor))
        
        
        let newTracker = Tracker(name: trackerName,
                                 color: color,
                                 emoji: selectedEmoji,
                                 schedule: stringSchedule,
                                 trackerCategory: selectedCategory.name)
        return newTracker
    }
}
