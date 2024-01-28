//
//  AddingCategoryViewModel.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 27.01.2024.
//

import Foundation

@Observable
final class AddingCategoryViewModel {
    var newCategoryName: String
    var typeOfCategory: TypeOfCategory
    var editingCategory: TrackerCategory?
    
    init(newCategoryName: String = "",
         typeOfCategory: TypeOfCategory,
         editingCategory: TrackerCategory? = nil) {
        self.newCategoryName = newCategoryName
        self.typeOfCategory = typeOfCategory
        self.editingCategory = editingCategory
    }
    
    enum TypeOfCategory {
        case newCategory
        case editCategory
    }
}
