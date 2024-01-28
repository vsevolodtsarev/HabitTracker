//
//  CategoryView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 22.01.2024.
//

import SwiftUI
import SwiftData

struct NewCategoryView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State private var activateModalAddingCategoryView = false
    @Query(sort: \TrackerCategory.name) var categories: [TrackerCategory] = []
    @State var newCategoryViewModel: NewCategoryViewModel
    
    var body: some View {
        
        Text("Категория")
            .padding(.top)
        
        if !categories.isEmpty {
            
            List {
                ForEach(categories) { category in
                    HStack {
                        Text(category.name)
                        Spacer()
                        Image(systemName: "checkmark")
                            .foregroundStyle(category == newCategoryViewModel.selectedCategory ? .blue : .clear)
                    }
                    .contextMenu(menuItems: {
                        Button(action: {
                            
                            newCategoryViewModel.categoryToEdit = category
                            
                        }) {
                            Text("Редактировать")
                        }
                        
                        Button(role: .destructive ,action: {
                            context.delete(category)
                        }) {
                            Text("Удалить")
                        }
                    })
                    .sheet(item: $newCategoryViewModel.categoryToEdit) { category in
                        UpdateCategoryView(category: category)
                    }
                    .onTapGesture {
                        newCategoryViewModel.selectedCategory = category
                        dismiss()
                    }
                    .frame(height: 60)
                    .listRowBackground(Color(red: 0.9, green: 0.91, blue: 0.92).opacity(0.3))
                }
            }
            
            .scrollContentBackground(.hidden)
            .padding(.top, -20)
            
        } else {
            VStack {
                Spacer()
                Image("notFoundCategories")
                    .frame(width: 80, height: 80, alignment: .center)
                Text("Привычки и события можно \n     объединять по смыслу")
                    .font(.system(size: 12))
                Spacer()
            }
        }
        
        LargeButton(buttonName: "Добавить Категорию",
                    isActive: Binding(get: {
            newCategoryViewModel.selectedCategory == nil
        }, set: { _ in }),
                    didTapButton: {
            activateModalAddingCategoryView.toggle()
        })
        .padding(.bottom, 20)
        .sheet(isPresented: $activateModalAddingCategoryView) {
            AddCategoryView(addingCategoryViewModel: AddCategoryViewModel())
        }
    }
}

#Preview {
    NewCategoryView(newCategoryViewModel: NewCategoryViewModel())
}
