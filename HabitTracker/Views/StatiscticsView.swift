//
//  StatiscticsView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 08.12.2023.
//

import SwiftUI

struct StatiscticsView: View {
    private let statisticsViewModel = StatisticsViewModel()
    
    var body: some View {
        VStack {
            Text("Статистика")
                .lineLimit(1)
                .font(.system(size: 34, weight: .bold, design: .none))
                .padding(.leading, -160)
                .padding(.top)
            Spacer()
            Image(.notFoundStatistics)
            Text("Анализировать пока нечего")
                .font(.system(size: 12))
            Spacer()
        }
    }
}

#Preview {
    StatiscticsView()
}
