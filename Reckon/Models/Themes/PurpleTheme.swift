//
//  PurpleTheme.swift
//  Reckon
//
//  Created by Conor Wilson on 12/23/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import Foundation
import SwiftUI

struct PurpleTheme: Theme, ColorTheme {
    var name: String = "Imperial"
    var baseColor: Color = Color(hex: 0xa374d5)

    func colorAtIndex(_ index: Int) -> Color {
        return color(for: index)
    }
}

extension PurpleTheme: PreviewPickerOptionContentProvider {
    var key: String {
        return name
    }

    var preview: Preview {
        return Preview(theme: self)
    }
}
