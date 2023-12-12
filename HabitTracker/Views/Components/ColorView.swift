//
//  ColorsView.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 12.12.2023.
//

import SwiftUI

struct ColorView: View {
    
    @State var selectedColor: Color?
    private let colors = [Color.selection1,
                          Color.selection2,
                          Color.selection3,
                          Color.selection4,
                          Color.selection5,
                          Color.selection6,
                          Color.selection7,
                          Color.selection8,
                          Color.selection9,
                          Color.selection10,
                          Color.selection11,
                          Color.selection12,
                          Color.selection13,
                          Color.selection14,
                          Color.selection15,
                          Color.selection16,
                          Color.selection17,
                          Color.selection18]
    
    private let columns = [GridItem(.fixed(52)),
                           GridItem(.fixed(52)),
                           GridItem(.fixed(52)),
                           GridItem(.fixed(52)),
                           GridItem(.fixed(52)),
                           GridItem(.fixed(52))]
    
    var body: some View {
        HStack {
            Text("Цвет")
                .font(.system(size: 19))
                .bold()
                .padding()
            Spacer()
        }
        .padding(.horizontal, 6)
        LazyVGrid(columns: columns) {
            ForEach(colors, id: \.self) { color in
                ZStack {
                    Text("")
                        .frame(width: 44, height: 44)
                        .background(color)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .frame(width: 52, height: 52)
                .background(Color.clear)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                .overlay {
                    RoundedRectangle(cornerRadius: 10).stroke(Color(color).opacity(color == selectedColor ? 0.3 : 0), lineWidth: 3)
                }
                .onTapGesture {
                    selectedColor = color
                }
            }
        }
    }
}

#Preview {
    ColorView()
}
