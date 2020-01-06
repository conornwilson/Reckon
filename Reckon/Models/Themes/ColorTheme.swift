//
//  ColorTheme.swift
//  Reckon
//
//  Created by Conor Wilson on 12/23/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import Foundation
import SwiftUI

protocol ColorTheme {
    var baseColor: Color { get }
    func color(for distance: Int) -> Color
}

extension ColorTheme {
    func color(for distance: Int) -> Color {
        guard distance > 0 else {
            return baseColor
        }

        return baseColor.darker(by: (CGFloat(5 * distance)))
    }
}
