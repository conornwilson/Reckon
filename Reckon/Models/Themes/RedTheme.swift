//
//  RedTheme.swift
//  Reckon
//
//  Created by Conor Wilson on 12/23/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import Foundation
import SwiftUI

struct RedTheme: Theme, ColorTheme {
    var name: String = "Fire"
    var baseColor: Color = Color(hex: 0xbb5a5a)

    func colorAtIndex(_ index: Int) -> Color {
        return color(for: index)
    }

    func preview() -> some View {
        VStack {
            Rectangle()
                .fill(self.baseColor)
                .frame(width: 50, height: 50)
            Text(self.name)
        }
    }
    
}
