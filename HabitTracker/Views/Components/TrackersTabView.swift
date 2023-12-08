//
//  TabView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 08.12.2023.
//

import SwiftUI

struct TrackersTabView: View {
    private let trackersTabName = NSLocalizedString("trackers", comment: "trackers")
    private let statisticTabName = NSLocalizedString("statistics", comment: "statistics")
    
    var body: some View {
        TabView {
            TrackersListView()
                .tabItem {
                    Label(trackersTabName, systemImage: "checkmark.circle")
                }
            
            StatiscticsView()
                .tabItem {
                    Label(statisticTabName, systemImage: "flag.checkered.circle")
                }
        }
    }
}

#Preview {
    TrackersTabView()
}
