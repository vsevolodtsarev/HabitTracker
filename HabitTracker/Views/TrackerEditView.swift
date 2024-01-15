//
//  TrackerEditView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 12.12.2023.
//

import SwiftUI

struct TrackerEditView: View {
    var typeOfTracker: typeOfTracker
    var viewName: String
    
    @State var trackerName: String = ""
    var body: some View {
        ScrollView {
            Text(viewName)
                .font(.system(size: 16))
                .padding(.top)
            Spacer()
            
            ZStack {
                TextField("Введите название трекера", text: $trackerName)
                    .frame(height: 75)
                    .padding(.leading)
                    .background(Color.backgroundLightGrayColor)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                Image(systemName: "minus.circle.fill")
                    .foregroundStyle(trackerName == "" ? .clear : .gray)
                    .padding(.leading, 320)
                    .onTapGesture {
                        trackerName = ""
                    }
            }
            .padding()
            
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
    TrackerEditView(typeOfTracker: .habit, viewName: "Новая привычка")
}
