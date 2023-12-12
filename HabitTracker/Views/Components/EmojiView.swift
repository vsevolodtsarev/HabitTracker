//
//  EmojiView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 12.12.2023.
//

import SwiftUI

struct EmojiView: View {
    
    private let emoji: [String] = [
        "🙂","😻","🌺","🐶","❤️","😱","😇","😡","🥶","🤔","🙌","🍔","🥦","🏓","🥇", "🎸","🏝","😪"
    ]
    
    private let columns = [GridItem(.fixed(52)), 
                           GridItem(.fixed(52)),
                           GridItem(.fixed(52)),
                           GridItem(.fixed(52)),
                           GridItem(.fixed(52)),
                           GridItem(.fixed(52))]
    
    var body: some View {
            HStack {
                Text("Emoji")
                    .font(.system(size: 19))
                    .bold()
                    .padding()
                Spacer()
        }
        LazyVGrid(columns: columns, spacing: 5) {
            ForEach(emoji, id: \.self) { emoji in
                Text(emoji)
                    .font(.system(size: 32))
                    .frame(width: 52, height: 52)
                    .background(Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }
}

#Preview {
    EmojiView()
}
