//
//  ScheduleView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 19.01.2024.
//

import SwiftUI

struct ScheduleView: View {
    @State var viewModel: ScheduleViewModel
    
    var body: some View {
        Text("Расписание")
        List(Schedule.allCases, id: \.rawValue) { schedule in
            Toggle(isOn: Binding(
                get: { viewModel.selectedSchedule.contains(schedule) },
                set: { _ in
                    viewModel.toggleSchedule(schedule: schedule)
                }),
                   label: {
                Text(schedule.rawValue)
            })
            .frame(height: 60)
            .listRowSeparator(.hidden)
            .listRowBackground(Color(red: 0.9, green: 0.91, blue: 0.92).opacity(0.3))
            .tint(.blue)
        }
        .scrollDisabled(true)
        .scrollContentBackground(.hidden)
        .padding(.top, -20)
        
        LargeButton(buttonName: "Готово",
                    isActive: Binding(
                        get: { !viewModel.isSelectionEmpty },
                        set: { _ in }),
                    didTapButton: viewModel.didTapDoneButton)
        .disabled(viewModel.selectedSchedule.isEmpty)
        .padding(.vertical, 30)
    }
}

#Preview {
    ScheduleView(viewModel: ScheduleViewModel())
}
