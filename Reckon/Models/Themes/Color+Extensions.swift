//
//  UIColor+Hex.swift
//  Reckon
//
//  Created by Conor Wilson on 12/23/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {

    init(hex: Int) {
        let red = (hex & 0xff0000) >> 16
        let green = (hex & 0xff00) >> 8
        let blue = hex & 0xff

        self.init(red: Double(red) / 0xff, green: Double(green) / 0xff, blue: Double(blue) / 0xff)
    }

    func lighter(by percentage: CGFloat = 30.0) -> Color {
        return self.adjust(by: abs(percentage) )
    }

    func darker(by percentage: CGFloat = 30.0) -> Color {
        return self.adjust(by: -1 * abs(percentage) )
    }

    private func adjust(by percentage: CGFloat = 30.0) -> Color {
        let color = self.uiColor()
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if color.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return Color(UIColor(red: min(red + percentage / 100, 1.0),
                           green: min(green + percentage / 100, 1.0),
                           blue: min(blue + percentage / 100, 1.0),
                           alpha: alpha))
        } else {
            return self
        }
    }

    private func uiColor() -> UIColor {
        let components = self.components()
        return UIColor(red: components.red, green: components.green, blue: components.blue, alpha: components.alpha)
    }

    private func components() -> ColorComponents {
        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0, alpha: CGFloat = 0.0

        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            blue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            alpha = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return ColorComponents(red: red, green: green, blue: blue, alpha: alpha)
    }

}

private struct ColorComponents {
    let red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat
}
