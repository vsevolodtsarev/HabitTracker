//
//  CategoryViewModel.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 22.01.2024.
//

import Foundation

final class NewCategoryViewModel {
    var selectedCategory: TrackerCategory?
    
    enum typeOfCategory {
        case allCategories
        case editCategory
    }
}
