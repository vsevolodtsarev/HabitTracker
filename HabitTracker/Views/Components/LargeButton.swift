//
//  LargeButton.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 11.12.2023.
//

import SwiftUI

struct LargeButton: View {
    @State var buttonName: String
    @Binding var isActive: Bool
    let didTapButton: () -> Void
    
    var body: some View {
        Button(action: didTapButton) {
            Text(buttonName)
        }
        .disabled(!isActive)
            .foregroundStyle(Color.whiteOnBlackColor)
            .frame(width: 335, height: 60)
            .background(isActive ? Color.blackOnWhiteColor : Color.inactiveButtonColor)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
