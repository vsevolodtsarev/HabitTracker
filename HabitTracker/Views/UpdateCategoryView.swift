//
//  UpdateCategoryView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 28.01.2024.
//

import SwiftUI

struct UpdateCategoryView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @Bindable var category: TrackerCategory
    
    var body: some View {
        Text("Редактирование категории")
            .padding(.top)
        
        TextField("Введите название категории", text: $category.name)
            .frame(height: 75)
            .padding(.leading)
            .background(Color.backgroundLightGrayColor)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding()
        Spacer()
        
        LargeButton(buttonName: "Готово",
                    isActive: Binding(get: {
            true
        }, set: { _ in })) {
            
            dismiss()
        }
        .padding()
    }
}

#Preview {
    UpdateCategoryView(category: TrackerCategory(name: "ggg"))
}
