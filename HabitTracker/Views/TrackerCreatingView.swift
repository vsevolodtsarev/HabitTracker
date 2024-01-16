//
//  TrackerCreatingView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 12.12.2023.
//

import SwiftUI

struct TrackerCreatingView: View {
    @State private var activateModalHabitView = false
    @State private var activateModalNonRegularView = false
    
    var body: some View {
        VStack(spacing: 16) {
            
            Text("Создание трекера")
                .font(.system(size: 16))
                .padding(.top)
            Spacer()
            
            LargeButton(buttonName: "Привычка", isActive: true, didTapButton: {
                activateModalHabitView.toggle()
            })
            .sheet(isPresented: $activateModalHabitView, content: {
                NavigationView {
                    TrackerEditView(typeOfTracker: .habit, viewName: "Новая привычка")
                }
            })
            
            LargeButton(buttonName: "Нерегулярное событие", isActive: true, didTapButton: {
                activateModalNonRegularView.toggle()
            })
            .sheet(isPresented: $activateModalNonRegularView, content: {
                NavigationView {
                    TrackerEditView(typeOfTracker: .nonRegularEvent, viewName: "Новое нерегулярное событие")
                }
            })
            Spacer()
        }
    }
}

#Preview {
    TrackerCreatingView()
}
