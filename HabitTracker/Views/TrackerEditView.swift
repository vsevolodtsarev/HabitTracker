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
                
                TextField("Введите название трекера", text: $trackerName) {
                    
                }
                    .frame(height: 75)
                    .background(Color.backgroundLightGrayColor)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding()
        }
    }
}

#Preview {
    TrackerEditView(typeOfTracker: .habit, viewName: "Новая привычка")
}
