//
//  EmojiView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 12.12.2023.
//

import SwiftUI

struct EmojiView: View {
    
    @State var selectedEmoji: String?
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
        .padding(.horizontal, 6)
        LazyVGrid(columns: columns) {
            ForEach(emoji, id: \.self) { emoji in
                Text(emoji)
                    .font(.system(size: 37))
                    .frame(width: 52, height: 52)
                    .background(selectedEmoji == emoji ? Color.backgroundGrayColor : Color.clear)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .onTapGesture {
                        selectedEmoji = emoji
                    }
            }
        }
    }
}

#Preview {
    EmojiView()
}
