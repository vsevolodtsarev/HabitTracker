//
//  TrackerEditView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 12.12.2023.
//

import SwiftUI

struct TrackerEditView: View {
    @State var viewModel: TrackerEditViewModel
    @State private var activateModalSchedule = false
    private let characterLimit = 36
    
    var body: some View {
        ScrollView {
            Text(viewModel.viewName)
                .font(.system(size: 16))
                .padding(.top)
            Spacer()
            
            ZStack {
                TextField("Введите название трекера", text: $viewModel.trackerName)
                    .frame(height: 75)
                    .padding(.leading)
                    .background(Color.backgroundLightGrayColor)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .onChange(of: viewModel.trackerName) {
                        if viewModel.trackerName.count > characterLimit {
                            viewModel.trackerName = String(viewModel.trackerName.prefix(characterLimit))
                        }
                    }
                  
                Image(systemName: "minus.circle.fill")
                    .foregroundStyle(viewModel.trackerName == "" ? .clear : .gray)
                    .padding(.leading, 320)
                    .onTapGesture {
                        viewModel.trackerName = ""
                    }
            }
            .padding()
            
            Text("Ограничение 38 символов")
                .font(.system(size: 17, weight: .light))
                .foregroundStyle(.red)
                .opacity(viewModel.trackerName.count >= 36 ? 1 : 0)
                .padding(.top, -15)
                .padding(.bottom, viewModel.trackerName.count >= characterLimit ? 20 : -30)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Категория")
                    Spacer()
                        .frame(width: 222)
                    Button("", systemImage: "chevron.right") {
                        print("1")
                    }
                    .foregroundStyle(.gray)
                }
                .padding(.leading)
                
                if viewModel.typeOfTracker == .habit {
                    Divider()
                        .padding()
                    HStack {
                        Text("Расписание")
                        Spacer()
                            .frame(width: 210)
                        Button("", systemImage: "chevron.right") {
                            activateModalSchedule.toggle()
                        }
                        .sheet(isPresented: $activateModalSchedule, content: {
                            NavigationView {
                                ScheduleView()
                            }
                        })
                        .foregroundStyle(.gray)
                        
                    }
                    .padding(.leading)
                }
            }
            .frame(width: 360, height: viewModel.typeOfTracker == .habit ? 150 : 75)
            .background(Color(red: 0.9, green: 0.91, blue: 0.92).opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            EmojiView(selectedEmoji: $viewModel.selectedEmoji)
            
            ColorView(selectedColor: $viewModel.selectedColor)
            
            HStack {
                Button("Отменить") {
                    viewModel.didTapCancelButton()
                }
                .frame(width: 166, height: 60)
                .foregroundStyle(.red)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.red, lineWidth: 1)
                )
                
                Button("Создать") {
                    viewModel.didTapCreateButton()
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
    TrackerEditView(viewModel: TrackerEditViewModel(typeOfTracker: .habit, viewName: "Новая привычка"))
}
