//
//  TrackerEditView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 12.12.2023.
//

import SwiftUI

struct TrackerEditView: View {
    @State var viewModel: TrackerEditViewModel
    
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
                
                Image(systemName: "minus.circle.fill")
                    .foregroundStyle(viewModel.trackerName == "" ? .clear : .gray)
                    .padding(.leading, 320)
                    .onTapGesture {
                        viewModel.trackerName = ""
                    }
            }
            .padding()
            
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
                            print("2")
                        }
                        .foregroundStyle(.gray)

                    }
                    .padding(.leading)
                }
            }
            .frame(width: 360, height: viewModel.typeOfTracker == .habit ? 150 : 75)
            .background(Color(red: 0.9, green: 0.91, blue: 0.92).opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 16))
           
            
            EmojiView()
            
            ColorView()
            
            HStack {
                Button("Отменить") {
                    didTapCancelButton()
                }
                .frame(width: 166, height: 60)
                .foregroundStyle(.red)
                .border(.red)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                
                Button("Создать") {
                    didTapCreateButton()
                }
                .frame(width: 166, height: 60)
                .foregroundStyle(.white)
                .background(.placeholder)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .padding()
        }
    }
    
    func didTapCreateButton() {
        print("1")
    }
    
    func didTapCancelButton() {
        print("2")
    }
}

#Preview {
    TrackerEditView(viewModel: TrackerEditViewModel(typeOfTracker: .habit, viewName: "Новая привычка"))
}
