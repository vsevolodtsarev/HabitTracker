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
    var schedule: Set<Schedule>?
    var selectedCategory: TrackerCategory?
    
    init(typeOfTracker: TypeOfTracker, viewName: String) {
        self.typeOfTracker = typeOfTracker
        self.viewName = viewName
    }
    
    func didTapCreateButton() {
        print(selectedEmoji)
    }
    
    func didTapCancelButton() {
        print(selectedColor)
    }
}
