//
//  AddingCategoryView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 27.01.2024.
//

import SwiftUI
import SwiftData

struct AddingCategoryView: View {
    @Environment(\.dismiss) private var dismiss
    @State var addingCategoryViewModel: AddingCategoryViewModel
    @Environment(\.modelContext) private var context
    
    var body: some View {
        switch addingCategoryViewModel.typeOfCategory {
        case .newCategory:
            Text("Новая категория")
                .padding(.top)
        case .editCategory:
            Text("Редактирование категории")
                .padding(.top)
        }
        
        TextField("Введите название категории", text: $addingCategoryViewModel.newCategoryName)
            .frame(height: 75)
            .padding(.leading)
            .background(Color.backgroundLightGrayColor)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding()
        Spacer()
        
        LargeButton(buttonName: "Готово",
                    isActive: Binding(get: {
            !addingCategoryViewModel.newCategoryName.isEmpty
        }, set: { _ in })) {
            let newCategory = TrackerCategory(name: addingCategoryViewModel.newCategoryName)
            context.insert(newCategory)
            dismiss()
        }
        .padding()
    }
}

#Preview {
    AddingCategoryView(addingCategoryViewModel: AddingCategoryViewModel(typeOfCategory: .editCategory))
}
