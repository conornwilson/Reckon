//
//  StandardSequence.swift
//  Reckon
//
//  Created by Conor Wilson on 12/15/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import Foundation

struct StandardSequence: Sequence {
    var name: String = "Standard"

    var values: [String] = [
        "0",
        "½",
        "1",
        "2",
        "3",
        "5",
        "8",
        "13",
        "20",
        "40",
        "100",
        "∞",
        "?"
    ]
}

extension StandardSequence: PreviewPickerOptionContentProvider {
    var key: String {
        return name
    }

    var preview: Preview {
        return Preview(sequence: self)
    }
}
