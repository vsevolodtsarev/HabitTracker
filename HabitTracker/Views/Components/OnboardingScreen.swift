//
//  OnboardingView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 26.01.2024.
//

import SwiftUI

struct OnboardingScreen: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    let image: ImageResource
    let subscription: String
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                Spacer()
                    .frame(height: 450)
                Text(subscription)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 32, weight: .bold))
                Spacer()
                LargeButton(buttonName: "Вот это технологии!",
                            isActive: Binding(get: { return true },
                                              set: { _ in })) {
                    isOnboarding = false
                }
                                              .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    OnboardingScreen(image: .onboarding1, subscription: "Отслеживайте только то, что хотите")
}
