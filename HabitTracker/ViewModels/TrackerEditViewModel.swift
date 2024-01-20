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
    var typeOfTracker: typeOfTracker 
    var viewName: String
    var trackerName: String = ""
    var selectedEmoji: String? = nil
    var selectedColor: Color? = nil
    
    init(typeOfTracker: typeOfTracker, viewName: String) {
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
