//
//  TrackerCreatingView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 12.12.2023.
//

import SwiftUI

struct TrackerCreatingView: View {
    var body: some View {
        VStack(spacing: 16) {
            
            Text("Создание трекера")
                .font(.system(size: 16))
                .padding(.top)
            Spacer()
            
            LargeButton(buttonName: "Привычка", isActive: true, didTapButton: {
                print("1button")
            })
            
            LargeButton(buttonName: "Нерегулярное событие", isActive: true, didTapButton: {
                print("2button")
            })
            Spacer()
        }
    }
}

#Preview {
    TrackerCreatingView()
}
