//
//  TrackerView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 08.12.2023.
//

import SwiftUI

struct TrackerCell: View {
    @State var tracker: Tracker
    @State private var isPlusButtonPressed = false
    @State var buttonColor: Color
    
    init(tracker: Tracker, isPlusButtonPressed: Bool = false) {
        self.tracker = tracker
        self.isPlusButtonPressed = isPlusButtonPressed
        buttonColor = Color.stringToColor(tracker.color)
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Text(tracker.emoji)
                    .overlay {
                        Circle().stroke(.white.opacity(0.3), lineWidth: 10)
                    }
                Spacer()
                Image(systemName: "pin.fill")
                    .foregroundStyle(.white)
                    .font(.system(size: 15))
                    .opacity(tracker.isPinned ? 1 : 0)
            }
            Spacer(minLength: 8)
            
            HStack {
                Text(tracker.name)
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
                Spacer()
            }
        }
        .padding(12)
        .background(Color.stringToColor(tracker.color))
        .cornerRadius(16)
        .frame(width: 167, height: 90)
        
        HStack {
            Text(String.localizedStringWithFormat(NSLocalizedString("days", comment: "days count"), tracker.recordCount))
                .font(.system(size: 12))
                .padding(.leading, 12)
                .padding(.bottom, 50)
            Spacer()
            ZStack {
                Button(action: {
                    tracker.recordCount += 1
                    isPlusButtonPressed.toggle()
                    buttonColor = isPlusButtonPressed ? buttonColor.opacity(0.3) : Color.stringToColor(tracker.color)
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
