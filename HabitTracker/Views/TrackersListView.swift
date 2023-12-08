//
//  ContentView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 06.12.2023.
//

import SwiftUI
import SwiftData

struct TrackersListView: View {
    private let title = NSLocalizedString("trackers", comment: "Trackers")
    
    @State private var currentDate = Date()
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(action: plusButtonTap) {
                    Image(systemName: "plus")
                        .foregroundStyle(.black)
                        .font(.title)
                }
                
                DatePicker(selection: $currentDate, displayedComponents: [.date]) {
                }
                
            }
            .padding(.horizontal, 16)
            
            HStack {
                Text(title)
                    .font(.system(size: 34, weight: .bold, design: .none))
                Spacer()
            }
            .padding(.horizontal, 16)
            VStack {
                
            }
            Spacer()
        }
    }
    
    private func plusButtonTap() {
        print("\(currentDate)")
    }
}

#Preview {
    TrackersListView()
}
