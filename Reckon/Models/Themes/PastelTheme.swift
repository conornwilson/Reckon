//
//  PastelTheme.swift
//  Reckon
//
//  Created by Conor Wilson on 12/23/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import Foundation
import SwiftUI

struct PastelTheme: Theme {

    private let colors: [Color] = [
        Color(hex: 0x32afa9),
        Color(hex: 0xf67280),
        Color(hex: 0xa4d4ae),
        Color(hex: 0xe5b0ea),
        Color(hex: 0xeceba7),
        Color(hex: 0x556fb5),
        Color(hex: 0xf67280),
        Color(hex: 0x4baea0),
        Color(hex: 0xed9a73),
        Color(hex: 0x385170),
        Color(hex: 0xf5b5fc),
        Color(hex: 0xe4508f),
        Color(hex: 0x7189bf),
        Color(hex: 0x305f72),
        Color(hex: 0xdefcf9),
        Color(hex: 0x484c7f),
    ]

    var name: String = "Pastel"

    func colorAtIndex(_ index: Int) -> Color {
        guard colors.indices.contains(index) else {
            return colors.randomElement()!
        }

        return colors[index]
    }

}

extension PastelTheme: PreviewPickerOptionContentProvider {
    var key: String {
        return name
    }

    var preview: Preview {
        return Preview(theme: self)
    }
}
