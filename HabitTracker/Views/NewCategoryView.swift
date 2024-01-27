//
//  CategoryView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 22.01.2024.
//

import SwiftUI

struct NewCategoryView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var activateModalAddingCategoryView = false
    let newCategoryViewModel: NewCategoryViewModel
    
    var body: some View {
        
        Text("Категория")
            .padding(.top)
        
        if !newCategoryViewModel.mockCategories.isEmpty {
            
            List {
                ForEach(newCategoryViewModel.mockCategories) { category in
                    HStack {
                        Text(category.name)
                        Spacer()
                        Image(systemName: "checkmark")
                            .foregroundStyle(category == newCategoryViewModel.selectedCategory ? .blue : .clear)
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
            }
            Spacer()
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
            AddingCategoryView()
        }
    }
}

#Preview {
    NewCategoryView(newCategoryViewModel: NewCategoryViewModel())
}
