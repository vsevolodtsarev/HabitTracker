//
//  TrackerEditViewModel.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 18.01.2024.
//

import Foundation

@Observable
final class TrackerEditViewModel {
    var typeOfTracker: typeOfTracker 
    var viewName: String
    var trackerName: String = ""
    
    init(typeOfTracker: typeOfTracker, viewName: String) {
        self.typeOfTracker = typeOfTracker
        self.viewName = viewName
    }
    
    func didTapCreateButton() {
            print("1")
        }
    
    func didTapCancelButton() {
            print("2")
        }
}
