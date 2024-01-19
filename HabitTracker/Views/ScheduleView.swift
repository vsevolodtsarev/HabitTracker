//
//  ScheduleView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 19.01.2024.
//

import SwiftUI

struct ScheduleView: View {
    @State private var selectedSchedule: Set<Schedule> = []
    @State private var isSelectionEmpty: Bool = true
    
    var body: some View {
        Text("Расписание")
        List(Schedule.allCases, id: \.self) { schedule in
           Toggle(isOn: Binding(
            get: { self.selectedSchedule.contains(schedule) },
               set: { isOn in
                   if isOn {
                       self.selectedSchedule.insert(schedule)
                   } else {
                       self.selectedSchedule.remove(schedule)
                   }
                   self.isSelectionEmpty = self.selectedSchedule.isEmpty
               }
           )) {
               Text(schedule.rawValue)
           }
           .frame(height: 60)
           .listRowBackground(Color(red: 0.9, green: 0.91, blue: 0.92).opacity(0.3))
           .tint(.blue)
        }
        .scrollDisabled(true)
        .scrollContentBackground(.hidden)
        .padding(.top, -20)
        
        LargeButton(buttonName: "Готово",
                    isActive: Binding(get: { !self.isSelectionEmpty }, set: { _ in }),
                    didTapButton: didTapDoneButton)
        .disabled(selectedSchedule.isEmpty)
        .padding(.vertical, 30)
    }
    
    private func didTapDoneButton() {
        print(selectedSchedule)
    }
}

#Preview {
    ScheduleView()
}
