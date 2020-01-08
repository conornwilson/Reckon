//
//  ImperialTheme.swift
//  Reckon
//
//  Created by Conor Wilson on 12/23/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import Foundation
import SwiftUI

struct ImperialTheme: Theme, ColorTheme {
    var name: String = "Imperial"
    // swiftlint:disable force_unwrapping
    var baseColor: UIColor = UIColor(named: "Imperial")!
    // swiftlint:enable force_unwrapping

    func colorAtIndex(_ index: Int) -> Color {
        return color(for: index)
    }
}

extension ImperialTheme: PreviewPickerOptionContentProvider {
    var key: String {
        return name
    }

    var preview: Preview {
        return Preview(theme: self)
    }
}
