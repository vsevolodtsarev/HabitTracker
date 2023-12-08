//
//  TrackerView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 08.12.2023.
//

import SwiftUI

struct TrackerView: View {
    @State private var isTrackerPin = false
    @State private var isPlusButtonPressed = false
    @State private var viewColor = Color.red
    @State private var buttonColor = Color.red
    
    var body: some View {
        
            VStack {
                HStack {
                        Text("😀")
                            .overlay {
                                Circle().stroke(.white.opacity(0.3), lineWidth: 10)
                            }
                    Spacer()
                    Image(systemName: "pin.fill")
                        .foregroundStyle(.white)
                        .font(.system(size: 15))
                        .opacity(isTrackerPin ? 1 : 0)
                }
                Spacer(minLength: 8)
                
                HStack {
                    Text("Тестовый трекер")
                        .font(.system(size: 12))
                        .foregroundStyle(.white)
                    Spacer()
                }
            }
            .padding(12)
            .background(viewColor)
            .cornerRadius(16)
            .frame(width: 167, height: 90)
            
            HStack {
                Text("0 дней")
                    .font(.system(size: 12))
                    .padding(.leading, 12)
                    .padding(.bottom, 50)
                Spacer()
                ZStack {
                    Button(action: {
                        isPlusButtonPressed.toggle()
                        buttonColor = isPlusButtonPressed ? buttonColor.opacity(0.3) : viewColor
                    }) {
                        Image(systemName: !isPlusButtonPressed ? "plus" : "checkmark")
                            .frame(width: 34, height: 34)
                            .foregroundStyle(.white)
                    }
                    .background(buttonColor)
                    .clipShape(Circle())
                    .padding(.trailing, 12)
                    .padding(.bottom, 50)
                }
            }
            .frame(width: 167, height: 90)
        }
}

#Preview {
    TrackerView()
}
