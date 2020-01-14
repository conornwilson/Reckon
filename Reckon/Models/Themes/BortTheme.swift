//
//  BortTheme.swift
//  Reckon
//
//  Created by Conor Wilson on 1/13/20.
//  Copyright © 2020 Conor Wilson. All rights reserved.
//

import Foundation
import SwiftUI

struct BortTheme: Theme, ColorTheme {
    var name: String = "Bort"
    // swiftlint:disable force_unwrapping
    var baseColor: UIColor = UIColor(named: "Bort")!
    // swiftlint:enable force_unwrapping

    func colorAtIndex(_ index: Int) -> Color {
        return color(for: index)
    }

}

extension BortTheme: PreviewPickerOptionContentProvider {
    var key: String {
        return name
    }

    var preview: Preview {
        return Preview(theme: self)
    }
}
