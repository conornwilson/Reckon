//
//  OceanTheme.swift
//  Reckon
//
//  Created by Conor Wilson on 1/6/20.
//  Copyright © 2020 Conor Wilson. All rights reserved.
//

import Foundation
import SwiftUI

struct OceanTheme: Theme, ColorTheme {
    var name: String = "Ocean"
    // swiftlint:disable force_unwrapping
    var baseColor: UIColor = UIColor(named: "Ocean")!
    // swiftlint:enable force_unwrapping

    func colorAtIndex(_ index: Int) -> Color {
        return color(for: index)
    }

}

extension OceanTheme: PreviewPickerOptionContentProvider {
    var key: String {
        return name
    }

    var preview: Preview {
        return Preview(theme: self)
    }
}
