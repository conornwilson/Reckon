//
//  FireTheme.swift
//  Reckon
//
//  Created by Conor Wilson on 12/23/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import Foundation
import SwiftUI

struct FireTheme: Theme, ColorTheme {
    var name: String = "Fire"
    var baseColor: Color = Color(hex: 0xbb5a5a)

    func colorAtIndex(_ index: Int) -> Color {
        return color(for: index)
    }
    
}

extension FireTheme: PreviewPickerOptionContentProvider {
    var key: String {
        return name
    }

    var preview: Preview {
        return Preview(theme: self)
    }
}
