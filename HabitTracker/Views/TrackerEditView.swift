//
//  TrackerEditView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 12.12.2023.
//

import SwiftUI

struct TrackerEditView: View {
    @Environment(\.dismiss) private var dismiss
    @State var trackerEditViewModel: TrackerEditViewModel
    @State private var activateModalSchedule = false
    private let characterLimit = 36
    let scheduleViewModel: ScheduleViewModel
    
    private var scheduleText: String {
        if trackerEditViewModel.schedule.count == 7 {
            return "Каждый день"
        } else if trackerEditViewModel.schedule.isEmpty {
            return  ""
        } else {
            return trackerEditViewModel.schedule.sorted { $0.orderDay < $1.orderDay }
                .map { $0.shortName }
                .joined(separator: ", ")
        }
    }
    
    var body: some View {
        ScrollView {
            Text(trackerEditViewModel.viewName)
                .font(.system(size: 16))
                .padding(.top)
            Spacer()
            
            ZStack {
                TextField("Введите название трекера", text: $trackerEditViewModel.trackerName)
                    .frame(height: 75)
                    .padding(.leading)
                    .background(Color.backgroundLightGrayColor)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .onChange(of: trackerEditViewModel.trackerName) {
                        if trackerEditViewModel.trackerName.count > characterLimit {
                            trackerEditViewModel.trackerName = String(trackerEditViewModel.trackerName.prefix(characterLimit))
                        }
                    }
                
                Image(systemName: "minus.circle.fill")
                    .foregroundStyle(trackerEditViewModel.trackerName == "" ? .clear : .gray)
                    .padding(.leading, 320)
                    .onTapGesture {
                        trackerEditViewModel.trackerName = ""
                    }
            }
            .padding()
            
            Text("Ограничение 36 символов")
                .font(.system(size: 17, weight: .light))
                .foregroundStyle(.red)
                .opacity(trackerEditViewModel.trackerName.count >= 36 ? 1 : 0)
                .padding(.top, -15)
                .padding(.bottom, trackerEditViewModel.trackerName.count >= characterLimit ? 20 : -30)
            
            NavigationStack {
                VStack(alignment: .leading) {
                    HStack {
                        VStack {
                            Text("Категория")
                            Text(((trackerEditViewModel.selectedCategory?.name.isEmpty) != nil) ? "" : "1")
                                .padding(.leading, -40)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                            .frame(width: 222)
                        Button("", systemImage: "chevron.right") {
                            print("1")
                        }
                        .foregroundStyle(.gray)
                    }
                    .frame(height: 50)
                    .padding(.leading)
                    
                    if trackerEditViewModel.typeOfTracker == .habit {
                        Divider()
                            .padding(.horizontal)
                            .padding(.bottom, 8)
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Расписание")
                                Text(scheduleText)
                                    .frame(maxWidth: 400, alignment: .leading)
                                    .foregroundColor(.gray)
                            }
                            
                            Button("", systemImage: "chevron.right") {
                                activateModalSchedule.toggle()
                            }
                            .padding()
                            .foregroundStyle(.gray)
                            .sheet(isPresented: $activateModalSchedule, onDismiss: {
                                trackerEditViewModel.schedule = scheduleViewModel.selectedSchedule
                            },content: {
                                
                                ScheduleView(viewModel: scheduleViewModel)
                            })
                        }
                        .frame(height: 50)
                        .padding(.leading)
                    }
                }
                .frame(width: 360, height: trackerEditViewModel.typeOfTracker == .habit ? 150 : 75)
                .background(Color(red: 0.9, green: 0.91, blue: 0.92).opacity(0.3))
                
            }
            .frame(width: 360, height: trackerEditViewModel.typeOfTracker == .habit ? 150 : 75)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            EmojiView(selectedEmoji: $trackerEditViewModel.selectedEmoji)
            
            ColorView(selectedColor: $trackerEditViewModel.selectedColor)
            
            HStack {
                Button("Отменить") {
                    dismiss()
                }
                .frame(width: 166, height: 60)
                .foregroundStyle(.red)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.red, lineWidth: 1)
                )
                
                Button("Создать") {
                    trackerEditViewModel.didTapCreateButton()
                }
                .frame(width: 166, height: 60)
                .foregroundStyle(.white)
                .background(.placeholder)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .padding()
        }
    }
}

#Preview {
    TrackerEditView(trackerEditViewModel: TrackerEditViewModel(typeOfTracker: .habit, viewName: "Новая привычка"), scheduleViewModel: ScheduleViewModel())
}
