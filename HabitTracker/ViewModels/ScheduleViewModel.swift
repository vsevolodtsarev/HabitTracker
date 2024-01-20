//
//  ScheduleViewModel.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 20.01.2024.
//

import Foundation

@Observable
final class ScheduleViewModel {
    var selectedSchedule: Set<Schedule> = []
    var isSelectionEmpty: Bool = true
    
    func toggleSchedule(schedule: Schedule) {
        if selectedSchedule.contains(schedule) {
            selectedSchedule.remove(schedule)
        } else {
            selectedSchedule.insert(schedule)
        }
        isSelectionEmpty = selectedSchedule.isEmpty
    }
    
    func didTapDoneButton() {
        print(selectedSchedule)
    }
}
