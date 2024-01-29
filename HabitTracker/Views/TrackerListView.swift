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
    @State private var activateModalView = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    activateModalView.toggle()
                }) {
                    Image(systemName: "plus")
                        .foregroundStyle(Color.blackOnWhiteColor)
                        .font(.title)
                }
                .sheet(isPresented: $activateModalView) {
                    NavigationView {
                        TrackerCreatingView()
                    }
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
}
