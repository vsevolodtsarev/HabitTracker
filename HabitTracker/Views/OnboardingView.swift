//
//  OnboardingView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 26.01.2024.
//

import SwiftUI

struct OnboardingView: View {
    @State var currentIndex: Int = 0
    
    var body: some View {
        TabView(selection: $currentIndex) {
            OnboardingScreen(image: .onboarding1, subscription: "Отслеживайте только то, что хотите")
                .ignoresSafeArea()
                .tag(0)
            
            OnboardingScreen(image: .onboarding2, subscription: "Даже если это \n не литры воды и йога")
                .ignoresSafeArea()
                .tag(1)
            
        }
        .ignoresSafeArea()
        .tabViewStyle(.page(indexDisplayMode: .never))
     
    }
}

#Preview {
    OnboardingView()
}


