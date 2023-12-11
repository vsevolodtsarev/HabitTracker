//
//  TabView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 08.12.2023.
//

import SwiftUI

struct TrackersTabView: View {
    
    var body: some View {
        TabView {
            TrackersListView()
                .tabItem {
                    Label("trackers", systemImage: "checkmark.circle")
                }
            
            StatiscticsView()
                .tabItem {
                    Label("statistics", systemImage: "flag.checkered.circle")
                }
        }
    }
}

#Preview {
    TrackersTabView()
}
