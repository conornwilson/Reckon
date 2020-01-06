//
//  TShirtSequence.swift
//  Reckon
//
//  Created by Conor Wilson on 12/15/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import Foundation

struct TShirtSequence: Sequence {
    var name: String = "T-Shirt"

    var values: [String] = [
        "S",
        "M",
        "L",
        "XL",
        "XXL",
        "XXXL",
        "∞",
        "?"
    ]
}

extension TShirtSequence: PreviewPickerOptionContentProvider {
    var key: String {
        return name
    }

    var preview: Preview {
        return Preview(sequence: self)
    }
}
