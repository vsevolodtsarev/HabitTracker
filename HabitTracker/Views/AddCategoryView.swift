//
//  AddingCategoryView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 27.01.2024.
//

import SwiftUI
import SwiftData

struct AddCategoryView: View {
    @Environment(\.dismiss) private var dismiss
    @State var addingCategoryViewModel: AddCategoryViewModel
    @Environment(\.modelContext) private var context
    
    var body: some View {
        Text("Новая категория")
            .padding(.top)
        
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
    AddCategoryView(addingCategoryViewModel: AddCategoryViewModel())
}
