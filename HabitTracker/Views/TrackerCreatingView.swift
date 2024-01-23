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
        NavigationStack(root:  {
            VStack(spacing: 16) {
                
                Text("Создание трекера")
                    .font(.system(size: 16))
                    .padding(.top)
                Spacer()
                
                LargeButton(buttonName: "Привычка",
                            isActive: Binding(get: { !self.activateModalHabitView }, set: { _ in }),
                            didTapButton: {
                    activateModalHabitView.toggle()
                })
                .sheet(isPresented: $activateModalHabitView, content: {
                    
                    TrackerEditView(viewModel: TrackerEditViewModel(typeOfTracker: .habit, viewName: "Новая привычка"), scheduleViewModel: ScheduleViewModel())
                })
                
                LargeButton(buttonName: "Нерегулярное событие",
                            isActive: Binding(get: { !self.activateModalNonRegularView }, set: { _ in }),
                            didTapButton: {
                    activateModalNonRegularView.toggle()
                })
                .sheet(isPresented: $activateModalNonRegularView, content: {
                 
                    TrackerEditView(viewModel: TrackerEditViewModel(typeOfTracker: .nonRegularEvent, viewName: "Новое нерегулярное событие"), scheduleViewModel: ScheduleViewModel())
                })
                Spacer()
            }
        })
    }
}

#Preview {
    TrackerCreatingView()
}
