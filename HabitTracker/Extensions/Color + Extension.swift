//
//  Color + Extension.swift
//  HabitTracker
//
//  Created by Всеволод Царев on 11.12.2023.
//

import Foundation
import SwiftUI

extension Color {
    static let selection1 = Color(UIColor(red: 0.99, green: 0.3, blue: 0.29, alpha: 1))
    static let selection2 = Color(UIColor(red: 1, green: 0.53, blue: 0.12, alpha: 1))
    static let selection3 = Color(UIColor(red: 0, green: 0.48, blue: 0.98, alpha: 1))
    static let selection4 = Color(UIColor(red: 0.43, green: 0.27, blue: 1, alpha: 1))
    static let selection5 = Color(UIColor(red: 0.2, green: 0.81, blue: 0.41, alpha: 1))
    static let selection6 = Color(UIColor(red: 0.9, green: 0.43, blue: 0.83, alpha: 1))
    static let selection7 = Color(UIColor(red: 0.98, green: 0.83, blue: 0.83, alpha: 1))
    static let selection8 = Color(UIColor(red: 0.2, green: 0.65, blue: 1, alpha: 1))
    static let selection9 = Color(UIColor(red: 0.27, green: 0.9, blue: 0.62, alpha: 1))
    static let selection10 = Color(UIColor(red: 0.21, green: 0.2, blue: 0.49, alpha: 1))
    static let selection11 = Color(UIColor(red: 1, green: 0.4, blue: 0.3, alpha: 1))
    static let selection12 = Color(UIColor(red: 1, green: 0.6, blue: 0.8, alpha: 1))
    static let selection13 = Color(UIColor(red: 0.96, green: 0.77, blue: 0.55, alpha: 1))
    static let selection14 = Color(UIColor(red: 0.47, green: 0.58, blue: 0.96, alpha: 1))
    static let selection15 = Color(UIColor(red: 0.51, green: 0.17, blue: 0.95, alpha: 1))
    static let selection16 = Color(UIColor(red: 0.68, green: 0.34, blue: 0.85, alpha: 1))
    static let selection17 = Color(UIColor(red: 0.55, green: 0.45, blue: 0.9, alpha: 1))
    static let selection18 = Color(UIColor(red: 0.18, green: 0.82, blue: 0.35, alpha: 1))
    

    static let inactiveButtonColor = Color(UIColor(red: 0.68, green: 0.69, blue: 0.71, alpha: 1))
    static let blackOnWhiteColor = Color("BlackOnWhiteColor")
    static let whiteOnBlackColor = Color("WhiteOnBlackColor")
    static let backgroundGrayColor = Color(red: 0.9, green: 0.91, blue: 0.92)
    static let backgroundLightGrayColor = Color(UIColor(red: 0.9, green: 0.91, blue: 0.92, alpha: 0.3))
    
    static func colorToString(_ color: UIColor) -> String {
        let components = color.cgColor.components
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0
        return String.init(
            format: "%02lX%02lX%02lX",
            lroundf(Float(r * 255)),
            lroundf(Float(g * 255)),
            lroundf(Float(b * 255))
        )
    }
    
    static func stringToColor(_ string: String) -> Color {
        var rgbValue:UInt64 = 0
        Scanner(string: string).scanHexInt64(&rgbValue)
        return Color(UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        ))
    }
}
