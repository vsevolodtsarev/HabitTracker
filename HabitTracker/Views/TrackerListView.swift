//
//  ContentView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 06.12.2023.
//

import SwiftUI
import SwiftData

struct TrackersListView: View {
    
    private let viewModel = TrackerListViewModel()
    @State private var currentDate = Date.getDateWithoutTime()
    
    func testFunc() {
        print("tested2")
    }
    
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
                .datePickerStyle(.compact)
            }
            .padding(.horizontal, 16)
            
            Text("trackers")
                .font(.system(size: 34, weight: .bold, design: .none))
                .padding(.trailing, 200)
            Spacer()
            
            NoTrackersPlaceHolder()
            Spacer()
        }
    }
    
    private struct NoTrackersPlaceHolder: View {
        var body: some View {
            VStack {
                Image("placeHolder1")
                Text("Что будем отслеживать?")
                    .font(.system(size: 12))
            }
        }
    }
    
    private func plusButtonTap() {
        print("\(currentDate)")
    }
}

#Preview {
    TrackersListView()
}
