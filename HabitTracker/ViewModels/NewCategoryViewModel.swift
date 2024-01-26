//
//  CategoryViewModel.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 22.01.2024.
//

import Foundation

@Observable
final class NewCategoryViewModel {
    var selectedCategory: TrackerCategory?
    
    enum typeOfCategory {
        case allCategories
        case editCategory
    }
    
    let mockCategories: [TrackerCategory] = [
        .init(name: "First Category"),
        .init(name: "Second Category"),
        .init(name: "Third Category")
    ]
}
